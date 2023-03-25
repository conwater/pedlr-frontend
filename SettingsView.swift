//
//  SettingsView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("Settings")
                    .font(.system(size: 36, weight: .heavy, design: .default))
                Spacer()
            }
            .padding()
        }
        .foregroundColor(Color("ForegroundColor"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
