//
//  FaceDetails.swift
//  FaceList
//
//  Created by Oleg Gavashi on 14.02.2024.
//

import SwiftUI

struct FaceDetails: View {
    let face: Face
    @State private var isVisible: Bool = false
    let updateFace: (Face) -> Void
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Avatar(face: face, image: nil, size: 300)
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
                    Button("Edit", action: {
                        isVisible = true
                    })
                }
            }
            .sheet(isPresented: $isVisible) {
                EditFace(face: face, addFace: updateFace)
            }
            .withAnimatedBackground(face: face)
        }
    }
}

#Preview {
    FaceDetails(face: Face.example,updateFace: {_ in })
}
