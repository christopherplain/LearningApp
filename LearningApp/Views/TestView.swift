//
//  TestView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/28/21.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var model: ContentModel
    @State var selectedAnswerIndex: Int?
    @State var submitted = false
    
    var body: some View {
        VStack(alignment: .leading) {
            let questionCount = model.currentModule?.test.questions.count ?? 0
            if model.currentQuestion != nil {
                
                // MARK: Question number
                let answers = model.currentQuestion!.answers
                Text("Question \(model.currentQuestionIndex! + 1) of \(questionCount)")
                    .padding(.leading)
                
                // MARK: Question text
                StyledTextView()
                    .padding(.horizontal)
                
                // MARK: Answer buttons
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(answers.indices, id: \.self) { index in
                            let answer = answers[index]
                            let buttonColor = getButtonColor(answerIndex: index)
                            Button(action: {
                                selectedAnswerIndex = index
                            }) {
                                ButtonView(text: answer, fontColor: .black, buttonColor: buttonColor, height: 48)
                            }
                            .disabled(submitted)
                        }
                    }
                    .padding()
                }
                
                // MARK: Submit button
                let buttonText = getButtonText()
                Button(action: {
                    if !submitted {
                        model.scoreQuestion(for: selectedAnswerIndex!)
                    } else {
                        model.nextQuestion()
                        selectedAnswerIndex = nil
                    }
                    submitted.toggle()
                }) {
                    ButtonView(text: buttonText, fontColor: .white, buttonColor: .green, height: 48)
                }
                .padding()
                .disabled(selectedAnswerIndex == nil)
            } else {
                TestResultView(testScore: model.testScore, questionCount: questionCount)
            }
        }
        .navigationTitle("\(model.currentModule?.category ?? "") Test")
    }
    
    func getButtonColor(answerIndex: Int) -> Color {
        if !submitted {
            return answerIndex == selectedAnswerIndex ? Color.gray : Color.white
        } else {
            if answerIndex == selectedAnswerIndex {
                return answerIndex == model.correctAnswerIndex ? Color.green : Color.red
            } else {
                return answerIndex == model.correctAnswerIndex ? Color.green : Color.white
            }
        }
    }
    
    func getButtonText() -> String {
        if !submitted {
            return "Submit"
        } else if model.hasNextQuestion() {
            return "Next"
        } else {
            return "Finish"
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        let model = ContentModel()
        TestView()
            .environmentObject(model)
            .onAppear(perform: {
                model.beginTest(0)
            })
    }
}
