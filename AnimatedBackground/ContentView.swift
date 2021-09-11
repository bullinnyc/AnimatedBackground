//
//  ContentView.swift
//  AnimatedBackground
//
//  Created by Dmitry Kononchuk on 11.09.2021.
//  Copyright © 2021 Dmitry Kononchuk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: - body Property
    var body: some View {
        ZStack {
            AnimatedBackgroundView(blurRadius: 20)
                .ignoresSafeArea()
            
            Text("Animated Background")
                .foregroundColor(.white)
        }
    }
}

// MARK: - Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .light)
    }
}
