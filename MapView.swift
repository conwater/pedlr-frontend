//
//  MapView.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/25/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var pedlrAPI: API
    
    var body: some View {
        Map(coordinateRegion: $pedlrAPI.region, showsUserLocation: true)
        .cornerRadius(24)
        .padding(.horizontal)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(API())
    }
}
