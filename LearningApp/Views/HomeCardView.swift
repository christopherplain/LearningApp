//
//  HomeCardView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/24/21.
//

import SwiftUI

struct HomeCardView: View {
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            HStack {
                Image(image)
                    .resizable()
                    .frame(width: 116, height: 116)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .fontWeight(.bold)
                    Text(description)
                        .font(.caption)
                        .padding(.bottom, 20)
                    HStack {
                        Image(systemName: "text.book.closed")
                        Text(count)
                            .font(Font.system(size: 10))
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(Font.system(size: 10))
                    }
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(image: "swift", title: "Learn Swift", description: "This is a description", count: "10 Lessons", time: "2 Hours")
    }
}
