//
//  ContentView.swift
//  Africa
//
//  Created by Sampel on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    let animals : [Animal] =
        Bundle.main.decode("animals.json")
    
     
    var body: some View {
        NavigationView{
            List {
                CoverImage()
                    .frame(height : 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { Animals in
                    NavigationLink(destination: AnimalDetalsView(animal: Animals)) {
                        AnimalListItemView(animal: Animals)
                    }
                   
                }
                
            }
            .navigationBarTitle("Africa", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
