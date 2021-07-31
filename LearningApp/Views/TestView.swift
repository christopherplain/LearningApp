//
//  TestView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/28/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel

    var body: some View {
        VStack {
            if model.currentQuestion != nil {
                Text("Question \(model.currentQuestionIndex! + 1) of \(model.currentModule!.test.questions.count)")
                StyledTextView()
            }
        }
        .padding()
        .navigationTitle("\(model.currentModule?.category ?? "") Test")
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
