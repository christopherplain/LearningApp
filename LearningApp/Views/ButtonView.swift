//
//  RectangleCardView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/28/21.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var fontColor: Color
    var buttonColor: Color
    var height: CGFloat

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(buttonColor)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: height)
            Text(text)
                .foregroundColor(fontColor)
                .fontWeight(.bold)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Test", fontColor: .white, buttonColor: .green, height: 48)
    }
}
