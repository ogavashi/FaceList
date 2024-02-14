//
//  WithAnimatedBackground.swift
//  FaceList
//
//  Created by Oleg Gavashi on 14.02.2024.
//

import ColorKit
import SwiftUI

struct WithAnimatedBackground<Content: View>: View {
    let face: Face?
    var content: () -> Content
    
    @State private var colors: [Color] = []
    
    var body: some View {
        AnimatedBackground(colors: colors)
            .task {
                do {
                    guard let uiImage = face?.getUIImage else { return }

                    self.colors = try uiImage.dominantColors().map { Color(uiColor: $0) }
                } catch {
                    print(error)
                }
            }
            .overlay(content())
    }
}

#Preview {
    WithAnimatedBackground(face: .example, content: { Text("Content") })
}
