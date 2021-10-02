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
    @State private var startAnimation = false
    
    // MARK: - Public Properties
    var blurRadius: CGFloat = 0
    var blurOpaque = false
    
    // MARK: - Private Properties
    private let colors = [
        Color("BlueSet"), Color("RedSet"), Color("VioletSet"), Color("PinkSet")
    ]
    
    // MARK: - body Property
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: startAnimation ? UnitPoint(x: 4, y: 0) : UnitPoint(x: 0, y: -2),
                endPoint: startAnimation ? UnitPoint(x: 0, y: 2) : UnitPoint(x: 4, y: 0)
            )
                .blur(radius: blurRadius, opaque: blurOpaque)
                .animation(
                    .easeInOut(duration: 6).repeatForever(),
                    value: startAnimation
                )
        }
        .onAppear {
            DispatchQueue.main.async {
                startAnimation.toggle()
            }
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
