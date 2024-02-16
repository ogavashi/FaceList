//
//  EditFace.ViewModel.swift
//  FaceList
//
//  Created by Oleg Gavashi on 16.02.2024.
//

import Foundation
import PhotosUI
import SwiftUI

extension EditFace {
    @Observable
    class ViewModel {
        var firstName: String
        var lastName: String
        var avatarItem: PhotosPickerItem?
        var imageData: Data?
        var avatarImage: Image?
        var addFace: (Face) -> Void
        var face: Face?
        
        let isNew: Bool
        
        init(face: Face?, addFace: @escaping (Face) -> Void) {
            if let face = face {
                self.firstName = face.firstName
                self.lastName = face.lastName ?? ""
                self.addFace = addFace
                self.isNew = false
                self.avatarImage = face.getImage
                self.face = face
                
                return
            }
            
            self.firstName = ""
            self.lastName = ""
            self.isNew = true
            self.addFace = addFace
        }
        
        func handleAdd() {
            if isNew {
                let newFace = Face(id: UUID(), firstName: self.firstName, lastName: self.lastName, imageData: imageData)
                addFace(newFace)
                
                return
            }
            
            var updatedFace = face!
            updatedFace.firstName = firstName
            updatedFace.lastName = lastName
            updatedFace.imageData = imageData
            addFace(updatedFace)
        }
        
        @Sendable func loadImage() async {
            if let loaded = try? await avatarItem?.loadTransferable(type: Image.self),
               let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                avatarImage = loaded
                imageData = data
            } else {
                print("Failed")
            }
        }
    }
}
