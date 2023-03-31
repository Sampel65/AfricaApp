//
//  VideoPlayView.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import SwiftUI
import AVKit

struct VideoPlayView: View {
    
    var videoSelector : String
    var videoTitle : String
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelector, fileFormat: "mp4")) {
                //Text(videoTitle)
            }
            .overlay(Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width : 32, height: 32)
                .padding(.top, 6)
                .padding(.horizontal, 8)
                     , alignment: .topLeading
            )
        }
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle,  displayMode: .inline)
    }
}

struct VideoPlayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayView(videoSelector: "lion", videoTitle: "lion ")
        }
    }
}
