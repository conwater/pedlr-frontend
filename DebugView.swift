//
//  DebugView.swift
//  pedlr
//
//  Created by Connor Filipiak on 1/10/23.
//

import SwiftUI

struct DebugView: View {
    @EnvironmentObject var pedlrAPI: API
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("Debug")
                    .font(.system(size: 36, weight: .heavy, design: .default))
                Spacer()
                VStack(alignment: .leading) {
                    Text("bike_id: " + pedlrAPI.bike.bike_id)
                    Text("set_unlocked: " + String(pedlrAPI.bike.set_unlocked))
                    Text("is_unlocked: " + String(pedlrAPI.bike.is_unlocked))
                    Text("set_alarm: " + String(pedlrAPI.bike.set_alarm))
                    Text("is_alarm: " + String(pedlrAPI.bike.is_alarm))
                    Text("GPS: " + String(pedlrAPI.bike.GPS[0]) + ", " + String(pedlrAPI.bike.GPS[1]))
                }
                Spacer()
            }
            .padding()
        }
        .foregroundColor(Color("ForegroundColor"))
        .onAppear {
            pedlrAPI.getData()
        }
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
            .environmentObject(API())
    }
}
