//
//  ContentView.swift
//  SwiftUIAnimationPractice
//
//  Created by Bongani Mepha on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        Button("loading") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .rotation3DEffect(Angle(degrees: 360), axis: (x: 1, y: 1, z: 1))
        .animation(.easeInOut(duration: 2), value: animationAmount)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
