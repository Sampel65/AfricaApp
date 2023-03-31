//
//  insertFactView.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import SwiftUI

struct insertFactView: View {
    
    let animal : Animal
    
    var body: some View {
        GroupBox {
            TabView{
                
                ForEach(animal.fact, id : \.self) { item in
                    Text(item)
                }
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight : 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct insertFactView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        insertFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
