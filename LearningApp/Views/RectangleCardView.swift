//
//  RectangleCardView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/28/21.
//

import SwiftUI

struct RectangleCardView: View {
    var text: String
    var color: Color
    var height: CGFloat

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(color)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: height)
            Text(text)
                .foregroundColor(.white)
                .fontWeight(.bold)
        }
    }
}

struct RectangleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCardView(text: "Test", color: .green, height: 48)
    }
}
