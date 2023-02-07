//
//  ContentView.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/10/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var pedlrAPI: API
    @State var showDebugView: Bool = false
    @State var showSettingsView: Bool = false
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                HeaderbarView(showDebugView: $showDebugView, showSettingsView: $showSettingsView)
                MapView()
                LockControlsView()
            }
            .sheet(isPresented: $showDebugView) {
                DebugView()
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
            .environmentObject(API())
    }
}
