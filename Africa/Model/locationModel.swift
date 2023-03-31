//
//  locationModel.swift
//  Africa
//
//  Created by Sampel on 07/03/2023.
//

import Foundation
import MapKit

struct NationLParkLocation : Codable, Identifiable {
    var id: String
    var name : String
    var image : String
    var latitude  : Double
    var longitude  : Double
    
    
    var Location : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
