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
                
                // MARK: Video
                let url = URL(string: Constants.videoHostURL + lesson!.video)
                if url != nil {
                    VideoPlayer(player: AVPlayer(url: url!))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                // MARK: Lesson content
                StyledTextView()
                    .padding(.horizontal)
                
                // MARK: Submit and complete button
                let buttonText = getButtonText()
                Button(action: {
                    buttonAction()
                }) {
                    ButtonView(text: buttonText, fontColor: .white, buttonColor: .green, height: 48)
                }
                .padding()
            }
        }
        .navigationTitle("\(lesson?.title ?? "")")
    }
    
    func buttonAction() {
        if model.hasNextLesson() {
            model.nextLesson()
        } else {
            model.lessonLinkSelected = nil
        }
    }
    
    func getButtonText() -> String {
        if model.hasNextLesson() {
            let title = model.currentModule!.content.lessons[model.currentLessonIndex! + 1].title
            return "Next Lesson: \(title)"
        } else {
            return "Complete"
        }
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
