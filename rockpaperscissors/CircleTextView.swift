//
//  CircleTextView.swift
//  rockpaperscissors
//
//  Created by Wai Thura Tun on 04/11/2023.
//

import SwiftUI

struct CircleTextView: View {
    var text: String = "☹️"
    var width: CGFloat
    var height: CGFloat
    var size: CGFloat
    var color: Color?
    var body: some View {
        ZStack {
            Circle()
                .frame(width: width, height: height)
                .foregroundColor((color != nil) ? color : .blue)
                .shadow(radius: 5)
            Text(text)
                .font(.system(size: size))
            
        }
    }
}

#Preview {
    CircleTextView(width: 100, height: 100, size: 50)
}
