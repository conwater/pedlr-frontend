//
//  LockControlsView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct LockControlsView: View {
    @State var alarm = false
    
    var body: some View {
        HStack(spacing: 16) {
            Button(action: {
                Task {
                    if alarm {
                        try await NetworkManager.instance.postData(set: "alarm", to: false)
                        alarm = false
                    }
                    else {
                        try await NetworkManager.instance.postData(set: "unlock", to: true)
                    }
                }
                HapticManager.instance.notification(type: .success)
            }) {
                Label("Unlock", systemImage: "lock.open.fill")
                    .font(.system(size: 24,
                                  weight: .semibold,
                                  design: .default))
            }
            .buttonStyle(LockControlsButtonStyle())
            .background(Color("CardColor"))
            .cornerRadius(24)
            Button(action: {
                Task {
                    alarm = true
                    try await NetworkManager.instance.postData(set: "alarm", to: true)
                }
                HapticManager.instance.notification(type: .success)
            }) {
                Label("Alarm", systemImage: "light.beacon.max.fill")
                    .font(.system(size: 24,
                                  weight: .semibold,
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
