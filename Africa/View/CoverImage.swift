//
//  CoverImage.swift
//  Africa
//
//  Created by Sampel on 04/03/2023.
//

import SwiftUI

struct CoverImage: View {
    // MARK : PROPERTIES
    let coverImages: [CoverImages] = Bundle.main.decode("covers.json")
    // MARK: BODY
    
    
    var body: some View {
        TabView{
            ForEach(coverImages) { item in
                Image(item.name)
                .resizable()
                .scaledToFill()
            }// : LOOP
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK : PREVIEW

struct CoverImage_Previews: PreviewProvider {
    static var previews: some View {
        CoverImage()
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
