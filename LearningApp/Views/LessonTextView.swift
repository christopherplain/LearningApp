//
//  LessonTextView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/27/21.
//

import SwiftUI

struct LessonTextView: UIViewRepresentable {
    @EnvironmentObject var model: ContentModel
    
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.isEditable = false
        return textView
    }

    func updateUIView(_ textView: UITextView, context: Context) {
        textView.attributedText = model.currentDescription
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

struct LessonTextView_Previews: PreviewProvider {
    static var previews: some View {
        LessonTextView()
    }
}
