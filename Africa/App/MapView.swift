//
//  MapView.swift
//  Africa
//
//  Created by Sampel on 04/03/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var Region: MKCoordinateRegion =  {
        var mapCoodinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        
        var MapZoneLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var MapRegion = MKCoordinateRegion(center: mapCoodinate, span: MapZoneLevel)
        
        return MapRegion
    }()
    
    let locations : [NationLParkLocation] = Bundle.main.decode("locations.json")
    
    
    var body: some View {
        //Map(coordinateRegion: $Region)
        
        Map(coordinateRegion: $Region, annotationItems: locations, annotationContent: { item in
            
            //MapPin(coordinate: item.Location, tint: .accentColor)
            
          //  MapAnnotation(coordinate: item.Location) {
            //    Image("logo")
              //      .resizable()
                //    .scaledToFit()
                  //  .frame(width: 32, height: 32, alignment: .center)
       //     }
            
            MapAnnotation(coordinate: item.Location) {
                MapAnnotationView(location: item)
            }
       })
        .overlay(
            HStack(alignment: .center, spacing: 12 ) {
                Image("compass")
                .resizable()
                .scaledToFit()
            .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        
                        Text("\(Region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                            
                    }
                    Divider()
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        
                        Text("\(Region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                            
                    }
                    
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
                )
                .padding(), alignment: .top
        
        )
        
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
