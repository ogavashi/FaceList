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
        private(set) var faces: [Face]
        
        init() {
            // Exmple
            self.faces = [Face.example]
            
            
            //            self.faces = [Face]()
        }
    }
}
