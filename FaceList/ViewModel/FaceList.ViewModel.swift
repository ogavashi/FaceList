//
//  FaceList.ViewModel.swift
//  FaceList
//
//  Created by Oleg Gavashi on 13.02.2024.
//

import Foundation

extension FaceList {
    @Observable
    class ViewModel {
        var faces: [Face]
        
        var isVisible = false
        
        init() {
            // Exmple
            self.faces = [Face.example]
        }
        
        func saveFace(face: Face) {
            if let index = faces.firstIndex(of: face) {
                faces.remove(at: index)
              

                faces.append(face)
                
               
                return
            }
            
            self.faces.append(face)
        }
        
        func handlePressPlus() {
            self.isVisible.toggle()
        }
    }
}
