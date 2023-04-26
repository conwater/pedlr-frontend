//
//  Mapper.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/27/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
}

class Mapper: ObservableObject {
    static let instance = Mapper()
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), latitudinalMeters: CLLocationDistance(250), longitudinalMeters: CLLocationDistance(250))
    @Published var location = Location(coordinate: CLLocationCoordinate2D(latitude: 40.427651, longitude: -86.913823)) // hardcoded location (b/c the annotation won't appear until in region)
    
    var recenter = true
    
    func updateMap(with: [Double]) {
        // formats GPS data into a CLLocationCoordinate2D
        let coordinate = CLLocationCoordinate2D(latitude: with[0], longitude: with[1])
        
        // moves the pin to the bike's location
        location.coordinate = coordinate
        
        // if first run, recenters map to the bike's location
        if recenter {
            region.center = coordinate
            recenter = false
        }
    }
}
