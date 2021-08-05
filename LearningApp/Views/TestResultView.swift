//
//  TestResultview.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/31/21.
//

import SwiftUI

struct TestResultView: View {
    @EnvironmentObject var model: ContentModel
    let testScore: Int
    let questionCount: Int
    
    var body: some View {
        VStack {
            
            // MARK: Result heading
            Spacer()
            Text(getResultHeading())
                .font(.title)
            
            // MARK: Result details
            Spacer()
            Text("You got \(testScore) out of \(questionCount) questions")
            
            // MARK: Complete button
            Spacer()
            Button(action: {
                model.testLinkSelected = nil
            }) {
                ButtonView(text: "Complete", fontColor: .white, buttonColor: .green, height: 48)
                    .padding()
            }
        }
    }
    
    func getResultHeading() -> String {
        let percent = Double(testScore) / Double(questionCount)
        
        if percent >= 0.8 {
            return "Awesome!"
        } else if percent >= 0.6 {
            return "Doing great!"
        } else {
            return "Keep learning."
        }
    }
}

struct TestResultView_Previews: PreviewProvider {
    static var previews: some View {
        TestResultView(testScore: 8, questionCount: 10)
            .environmentObject(ContentModel())
    }
}
