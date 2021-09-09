//
//  AnimatedBackgroundView.swift
//  AnimatedBackground
//
//  Created by Dmitry Kononchuk on 09.09.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct AnimatedBackgroundView: View {
    // MARK: - Property Wrappers
    @State private var start = UnitPoint(x: 0, y: -2)
    @State private var end = UnitPoint(x: 4, y: 0)
    @State private var startAnimation = false
    @State private var timerCounter = 0
    
    // MARK: - Public Properties
    var blurRadius: CGFloat = 0
    var blurOpaque = false
    
    // MARK: - Private Properties
    private let timer = Timer.publish(every: 0.01, on: .main, in: .common)
        .autoconnect()
    private let colors = [
        Color("BlueSet"), Color("RedSet"), Color("VioletSet"), Color("PinkSet")
    ]
    
    // MARK: - body Property
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: start,
            endPoint: end
        )
        .blur(radius: blurRadius, opaque: blurOpaque)
        .animation(
            startAnimation
                ? .easeInOut(duration: 6).repeatForever()
                : nil
        )
        .onAppear {
            DispatchQueue.global().async {
                startAnimation = true
            }
        }
        .onReceive(timer) { _ in
            if timerCounter == 1 {
                timer.upstream.connect().cancel()
                startAnimation = false
                return
            }
            start = UnitPoint(x: 4, y: 0)
            end = UnitPoint(x: 0, y: 2)
            timerCounter += 1
        }
    }
}

// MARK: - Preview Provider
struct AnimatedBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackgroundView(blurRadius: 20)
            .ignoresSafeArea()
            .environment(\.colorScheme, .light)
    }
}
