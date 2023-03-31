//
//  VideoModel.swift
//  Africa
//
//  Created by Sampel on 06/03/2023.
//

import Foundation


struct Video : Codable, Identifiable {
    let id : String
    let name : String
    let headline : String
    
    
    var thumbnail : String {
        "video-\(id)"
    }
}
