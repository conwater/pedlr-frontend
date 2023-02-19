//
//  LockControlsView.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/25/23.
//

import SwiftUI

struct LockControlsView: View {
    @EnvironmentObject var pedlrAPI: API
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                pedlrAPI.postData()
                HapticManager.instance.notification(type: .success)
            }) {
                Label("Unlock", systemImage: "lock.open.fill")
                    .font(.system(size: 24,
                                  weight: .bold,
                                  design: .default))
            }
            .buttonStyle(LockControlsButtonStyle())
            .background(Color("CardColor"))
            .cornerRadius(24)
            Button(action: {
                pedlrAPI.postData()
                HapticManager.instance.notification(type: .success)
            }) {
                Label("Alarm", systemImage: "light.beacon.max.fill")
                    .font(.system(size: 24,
                                  weight: .bold,
                                  design: .default))
            }
            .buttonStyle(LockControlsButtonStyle())
            .background(Color("AccentColor"))
            .cornerRadius(24)
        }
        .padding(16)
    }
}

struct LockControlsView_Previews: PreviewProvider {
    static var previews: some View {
        LockControlsView()
            .environmentObject(API())
    }
}

struct LockControlsButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color("ForegroundColor"))
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
    }
}
