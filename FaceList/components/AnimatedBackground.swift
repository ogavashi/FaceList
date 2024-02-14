//
//  AnimatedBackground.swift
//  FaceList
//
//  Created by Oleg Gavashi on 14.02.2024.
//

import SwiftUI

struct AnimatedBackground: View {
    @State private var start = UnitPoint(x: 0, y: 0)
    @State private var end = UnitPoint(x: 0, y: 0)
    
    private let timer = Timer
        .publish(every: 1, on: .main, in: .default)
        .autoconnect()
    
    var colors: [Color]
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: start, endPoint: end)
            .blur(radius: 200)
            .onReceive(timer) { _ in
                withAnimation(Animation.easeInOut(duration: 30).repeatForever()) {
                    start = randomPoint()
                    end = randomPoint()
                    start = randomPoint()
                    end = randomPoint()
                }
            }
    }
    
    private func randomPoint() -> UnitPoint {
        let x = CGFloat.random(in: -1...1)
        let y = CGFloat.random(in: -1...1)
        
        return UnitPoint(x: x, y: y)
    }
}
