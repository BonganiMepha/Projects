//
//  ContentView.swift
//  AnimationLoadingScreen
//
//  Created by Bongani Mepha on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var spin3D_x = false
    @State var spin3D_y = false
    @State var spin3D_xy = false
    
    
    var body: some View {
        ZStack {
        
           
         
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 100, height: 100)
                .foregroundColor(.purple)
                .rotation3DEffect(.degrees(spin3D_x ? 100: 1), axis: (x: spin3D_x ? 1:0, y: 0, z: 0))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: true), value: UUID())
                .onAppear(){
                    self.spin3D_x.toggle()
                }
            Circle()
                .stroke(  lineWidth: 5)
                .frame(width: 60, height: 60)
                .foregroundColor(.red)
                .rotation3DEffect(.degrees(spin3D_y ? 360 : 1), axis: (x: 0, y: spin3D_y ? 1 : 0, z: 0))
                .animation(Animation.easeOut(duration: 1).repeatForever(autoreverses: false), value: UUID())
                .onAppear(){
                    self.spin3D_y.toggle()
                }
            Circle()
                .stroke(lineWidth: 5)
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)
                .rotation3DEffect(.degrees(spin3D_xy ? 180 : 1), axis: (x: spin3D_xy ? 0:1, y: spin3D_xy ? 0: 1, z: 0))
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: false), value: UUID())
                .onAppear(){
                }
            
        }.onTapGesture {
            spin3D_xy.toggle()
        }
    }
}




extension View{
    func withoutAnimation() -> some View{
        self.animation(nil, value: UUID())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
