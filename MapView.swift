//
//  MapView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI
import MapKit

// 41.8819, -87.6178 Chicago

struct MapView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.8819, longitude: -87.6178), span: MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002))
    
    let location = Location(
        coordinate: CLLocationCoordinate2D(latitude: 41.8819, longitude: -87.6178)
    )

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                AnnotationView()
            }
        }
        .cornerRadius(24)
        .padding(.horizontal)
    }
}

struct Location: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
