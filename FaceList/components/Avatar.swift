//
//  Avatar.swift
//  FaceList
//
//  Created by Oleg Gavashi on 13.02.2024.
//

import SwiftUI

struct Avatar: View {
    let face: Face
    let size: CGFloat
    
    var body: some View {
        ZStack {
            if let image = face.getImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size, height: size)
                    .cornerRadius(size / 2)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 0)
                            .frame(width: size, height: size)
                    )
                    .shadow(radius: 10)
            } else {
                Circle()
                    .fill(.primary)
                    .frame(width: size, height: size)
                Text(getTitle())
                    .foregroundStyle(.blue)
                    .font(.system(size: size / 2))
            }
        }
    }
    
    
    func getTitle() -> String {
        return face.fullName.components(separatedBy: " ").map { $0.prefix(1) }.joined().uppercased()
    }
}

#Preview {
    Avatar(face: Face.example, size: 200)
}
