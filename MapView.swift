//
//  MapView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapper = Mapper.instance

    var body: some View {
        Map(coordinateRegion: $mapper.region, annotationItems: [mapper.location]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                AnnotationView()
            }
        }
        .cornerRadius(24)
        .padding(.horizontal)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
