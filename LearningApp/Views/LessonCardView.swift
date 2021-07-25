//
//  LessonCardView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/24/21.
//

import SwiftUI

struct LessonCardView: View {
    @EnvironmentObject var model: ContentModel
    let index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height: 66)
            HStack(spacing: 30) {
                Text("\(index + 1)")
                    .fontWeight(.bold)
                VStack(alignment: .leading) {
                    Text(lesson.title)
                        .fontWeight(.bold)
                    Text(lesson.duration)
                }
            }
            .padding()
        }
    }
}

struct LessonCardView_Previews: PreviewProvider {
    static var previews: some View {
        LessonCardView(index: 0)
            .environmentObject(ContentModel())
    }
}
