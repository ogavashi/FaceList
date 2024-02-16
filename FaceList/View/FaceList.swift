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
                    List($viewModel.faces, id: \.self, editActions: .delete) { $face in
                        NavigationLink {
                            FaceDetails(face: face, updateFace: viewModel.saveFace)
                        } label: {
                            ListRow(face: face)
                        }
                    }
                }
            }
            .navigationTitle("FaceList")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: viewModel.handlePressPlus) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isVisible) {
                EditFace(face: nil, addFace: viewModel.saveFace)
            }
        }
        
    }
}

#Preview {
    FaceList()
}
