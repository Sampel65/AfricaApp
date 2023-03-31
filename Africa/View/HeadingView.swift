//
//  HeadingView.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import SwiftUI

struct HeadingView: View {
    var headingImage : String
    var headingText : String
    
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title)
                .fontWeight(.bold)
                
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "wilderness in picture")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
