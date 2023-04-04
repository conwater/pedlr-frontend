//
//  ContentView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mapper = Mapper.instance
    @ObservedObject var notifier = Notifier.instance

    @State var showSettingsView = false
    @State var bike = Bike(bike_id: "", set_unlock: false, is_unlock: false, set_alarm: false, is_alarm: false, GPS: [0, 0])
    
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
        .task {
            while !Task.isCancelled {
                do {
                    bike = try await NetworkManager.instance.getData()
                    mapper.updateMap(with: bike.GPS)
                    notifier.checkState(states: [bike.set_alarm, bike.is_alarm])
                } catch {
                    print("ERROR")
                }
                try? await Task.sleep(nanoseconds: 10_000_000_000)
            }
        }
        .onAppear {
            notifier.requestPermissions()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
