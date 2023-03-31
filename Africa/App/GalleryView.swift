//
//  GalleryView.swift
//  Africa
//
//  Created by Sampel on 04/03/2023.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal: String = "lion"
    
    let animals : [Animal] = Bundle.main.decode("animals.json")
    let haptics  = UIImpactFeedbackGenerator(style: .medium)
    
    
   // let gridLayout : [GridItem] = [
     //   GridItem(.flexible()),
       // GridItem(.flexible()),
        //GridItem(.flexible()),
    //]
    
   // let gridLayout : [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
     
    @State private var  gridLayout : [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn :  Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ///GRID
        
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4, step : 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 0.8))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(minWidth: 450  , minHeight: 500)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
