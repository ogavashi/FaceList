//
//  FaceDetails.swift
//  FaceList
//
//  Created by Oleg Gavashi on 14.02.2024.
//

import SwiftUI

struct FaceDetails: View {
    let face: Face
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Avatar(face: face, size: 300)
                        .padding()
                    
                    VStack {
                        DetailsRow(label: "First name:", value: face.firstName)
                        DetailsRow(label: "Last name:", value: face.lastName ?? "")
                    }
                    Spacer()
                }
            }
            .navigationTitle(face.fullName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Edit", action: {})
                }
            }
            .withAnimatedBackground(face: face)
        }
    }
}

#Preview {
    FaceDetails(face: Face.example)
}
