//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Sampel on 08/03/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var RandomCircle  = Int.random(in: 12...16)
    @State private var IsAnimating = false
    
    
    //MARK : COORDINATE
    func randomCoordinate (max : CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // RANDOM SIZE
    func randomSize () ->  CGFloat {
        return CGFloat (Int.random(in: 10...300))
    }
    // RANDOM SCALE
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // RANDOM  SPEED
    func randomSpeed () -> Double{
        return Double.random(in: 0.25...1.0)
    }
    // RANDOM DELAY
    
    func randomDelay () -> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        GeometryReader {  geometry in
             
            ZStack {
                ForEach(0...RandomCircle, id: \.self ) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.16)
                        .frame(width: randomSize() , height: randomSize(), alignment: .center)
                        .scaleEffect(IsAnimating ? randomScale() : 1 )
                    .position(
                        x: randomCoordinate(max: geometry.size.width),
                        y: randomCoordinate(max: geometry.size.height)
                    
                    )
                    .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(randomSpeed())
                        .delay(randomDelay())
                    )
                    .onAppear(perform: {
                        IsAnimating = true
                    })
                   
                }
            }
            .drawingGroup()
        }
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
