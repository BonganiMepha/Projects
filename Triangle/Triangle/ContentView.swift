//
//  ContentView.swift
//  Triangle
//
//  Created by Bongani Mepha on 2023/03/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Triangle()
            Triangle()
                
                .rotation(Angle(degrees: 180.0))
                .offset()
        }
    }
 
}

struct Triangle : Shape {
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x : 200, y : 100))
        path.addLine (to : CGPoint(x: 300, y : 200))
        path.addLine (to : CGPoint(x: 100, y : 200))
        path.addLine (to : CGPoint(x: 200, y : 100))
        
        return path
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

