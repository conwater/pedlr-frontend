//
//  AnnotationView.swift
//  pedlr
//
//  Created by Connor Filipiak on 3/8/23.
//

import SwiftUI

struct AnnotationView: View {
    var body: some View {
        VStack {
            Image(systemName: "bicycle")
                .resizable()
                .scaledToFit()
                .frame(width: 28, height: 28)
                .foregroundColor(Color("ForegroundColor"))
                .padding(8)
                .background(Color("AccentColor"))
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(Color("AccentColor"))
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -12)
                .padding(.bottom, 36)
        }
//        .background(Color.blue) // make sure center is aligned
    }
}

struct AnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationView()
    }
}
