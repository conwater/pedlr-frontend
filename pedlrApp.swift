//
//  pedlrApp.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/10/23.
//

import SwiftUI

@main
struct pedlrApp: App {
    var pedlrAPI = API()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(pedlrAPI)
        }
    }
}
