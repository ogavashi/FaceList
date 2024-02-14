//
//  withAnimatedBackground.swift
//  FaceList
//
//  Created by Oleg Gavashi on 14.02.2024.
//

import SwiftUI

extension View {
    func withAnimatedBackground(face: Face?) -> some View {
        WithAnimatedBackground(face: face) {
            self
        }
    }
}
