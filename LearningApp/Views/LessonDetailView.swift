//
//  LessonDetailView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/26/21.
//

import SwiftUI
import AVKit

struct LessonDetailView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        let lesson = model.currentLesson
        VStack(alignment: .leading) {
            if lesson != nil {
                let url = URL(string: Constants.videoHostURL + lesson!.video)
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                }
                LessonTextView()
                if model.hasNextLesson() {
                    let nextLessonIndex = model.currentLessonIndex! + 1
                    let nextLessonTitle = model.currentModule!.content.lessons[nextLessonIndex].title
                    Button(action: {
                        model.beginLesson(nextLessonIndex)
                    }, label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.green)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .frame(height: 48)
                            Text("Next Lesson: \(nextLessonTitle)")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                    })
                }
            }
        }
        .padding()
        .navigationTitle("\(lesson?.title ?? "")")
    }
}

struct LessonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        LessonDetailView()
            .environmentObject(model)
            .onAppear(perform: {
                model.beginModule(0)
                model.beginLesson(0)
            })
    }
}
