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
        HStack {
            Button(action: { pedlrAPI.postData() }) {
                Image(systemName: "lock.open.fill")
                    .font(.system(size: 24))
                Text("Unlock")
                    .font(.system(size: 24,
                                  weight: .bold,
                                  design: .default))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 36)
            .background(Color("CardColor"))
            .cornerRadius(24)
            Spacer()
            Button(action: { pedlrAPI.postData() } ) {
                Image(systemName: "light.beacon.max.fill")
                    .font(.system(size: 24))
                Text("Alarm")
                    .font(.system(size: 24,
                                  weight: .bold,
                                  design: .default))
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 36)
            .background(Color("AccentColor"))
            .cornerRadius(24)
        }
        .padding()
        .foregroundColor(Color("ForegroundColor"))
    }
}

struct LockControlsView_Previews: PreviewProvider {
    static var previews: some View {
        LockControlsView()
            .environmentObject(API())
    }
}
