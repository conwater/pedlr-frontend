//
//  HeaderbarView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct HeaderbarView: View {
    @Binding var showSettingsView: Bool
    
    var body: some View {
        HStack(spacing: 24) {
            Text("My Bicycle")
                .font(.system(size: 36, weight: .heavy, design: .default))
            Spacer()
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
        HeaderbarView(showSettingsView: .constant(true))
    }
}
