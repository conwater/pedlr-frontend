//
//  HeaderbarView.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/25/23.
//

import SwiftUI

struct HeaderbarView: View {
    @Binding var showDebugView: Bool
    @Binding var showSettingsView: Bool
    
    var body: some View {
        HStack {
            Text("My Bicycle")
                .font(.system(size: 36, weight: .heavy, design: .default))
            Spacer()
            Button(action: { showDebugView = true }) {
                Image(systemName: "ant.fill")
                    .font(.system(size: 24))
                    .padding(.trailing, 16)
            }
            Button(action: { showSettingsView = true }) {
                Image(systemName: "gearshape.fill")
                    .font(.system(size: 24))
            }
        }
        .padding()
        .foregroundColor(Color("ForegroundColor"))
    }
}

struct HeaderbarView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderbarView(showDebugView: .constant(true), showSettingsView: .constant(true))
    }
}
