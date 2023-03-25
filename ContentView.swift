//
//  ContentView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var showSettingsView: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                HeaderbarView(showSettingsView: $showSettingsView)
                MapView()
                LockControlsView()
            }
            .sheet(isPresented: $showSettingsView) {
                SettingsView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
