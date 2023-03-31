//
//  AnimalDetalsView.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import SwiftUI

struct AnimalDetalsView: View {
    
    let animal : Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators:  false){
            VStack(alignment: .center, spacing: 20) {
               // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // TITLE
                Text(animal.name)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height : 6)
                            .offset(y: 14 )
                    )
                
                // HEADLINE
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "wilderness in picture")
                    insertGalleryView(animals: animal)
                }
                .padding(.horizontal)
                // FACTS
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know")
                    insertFactView(animal: animal)
                }
                
                // DESCRIPTION
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                        
                    
                }
                .padding(.horizontal)
                //MAP
                
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks ")
                    
                    insertMapView()
                }
                
                // LINK
                
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn more")
                    
                    ExternalWebLinkView(animal: animal)
                }
            }
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }
        
    }
}

struct AnimalDetalsView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetalsView(animal: animals[0])
        }
    }
}
