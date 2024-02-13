//
//  FaceList.swift
//  FaceList
//
//  Created by Oleg Gavashi on 13.02.2024.
//

import SwiftUI

struct FaceList: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.faces.isEmpty {
                    ContentUnavailableView("No faces", systemImage: "person", description: Text("You don't have any faces yet."))
                        .symbolVariant(.slash)
                } else {
                    List {
                        ForEach(viewModel.faces) { face in
                            NavigationLink {
                                Text(face.fullName)
                            } label: {
                               ListRow(face: face)
                            }
                        }
                    }
                }
            }
            .navigationTitle("FaceList")
        }
        
    }
}

#Preview {
    FaceList()
}
