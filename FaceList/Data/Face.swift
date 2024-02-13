//
//  Face.swift
//  FaceList
//
//  Created by Oleg Gavashi on 13.02.2024.
//

import Foundation
import UIKit
import SwiftUI

struct Face: Identifiable, Codable, Equatable, Comparable {
    let id: UUID
    let firstName: String
    let lastName: String?
    let imageData: Data?
    
    var fullName: String {
        guard let lastName = lastName else {
            return firstName
        }
        return "\(firstName) \(lastName)"
    }
    
    var getUIImage: UIImage? {
        if let imageData = imageData, let uiImage = UIImage(data: imageData) {
            return uiImage
        }
        
        return nil
    }
    
    var getImage: Image? {
        if let uiImage = getUIImage {
            return Image(uiImage: uiImage)
        }
        
        return nil
    }
    
    static func <(lhs: Face, rhs: Face) -> Bool {
        lhs.fullName < rhs.fullName
    }
    
    static func ==(lhs: Face, rhs: Face) -> Bool {
        lhs.fullName == rhs.fullName
    }
    
#if DEBUG
    static let example: Face = {
        guard let image = UIImage(named: "example") else {
            fatalError("Image not found in assets")
        }
        guard let imageData = image.pngData() else {
            fatalError("Unable to convert image to data")
        }
        return Face(id: UUID(), firstName: "Ryan", lastName: "Gosling", imageData: imageData)
    }()
#endif
}
