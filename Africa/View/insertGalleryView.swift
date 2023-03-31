//
//  insertGalleryView.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import SwiftUI

struct insertGalleryView: View {
    
    let animals : Animal
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animals.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame (height : 200)
                    .cornerRadius(12)
                }
            }
        }
    }
        
}

struct insertGalleryView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        
        insertGalleryView(animals: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
