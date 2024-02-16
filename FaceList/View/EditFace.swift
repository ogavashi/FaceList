//
//  EditFace.swift
//  FaceList
//
//  Created by Oleg Gavashi on 16.02.2024.
//

import PhotosUI
import SwiftUI

struct EditFace: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel: ViewModel
    
    init(face: Face?, addFace: @escaping (Face) -> Void) {
        _viewModel = State(initialValue: ViewModel(face: face, addFace: addFace))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Avatar(face: nil, image: viewModel.avatarImage, size: 250)
                PhotosPicker("Select image", selection: $viewModel.avatarItem, matching: .images)
                    .onChange(of: viewModel.avatarItem) {
                        Task(operation: viewModel.loadImage)
                    }
                Form {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                }
            }
            .navigationTitle(viewModel.isNew ? "New face" : "Updating face")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.handleAdd()
                        dismiss()
                    }
                    .disabled(viewModel.firstName.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    EditFace(face: .example, addFace: {_ in })
}
