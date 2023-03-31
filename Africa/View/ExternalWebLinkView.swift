//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    let animal : Animal
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
