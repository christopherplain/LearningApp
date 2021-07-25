//
//  LessonListView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/24/21.
//

import SwiftUI

struct LessonListView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if model.currentModule != nil {
                    ForEach(model.currentModule!.content.lessons.indices) { index in
                        LessonCardView(index: index)
                    }
                }
            }
            .padding()
            .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct LessonListView_Previews: PreviewProvider {
    static var previews: some View {
        LessonListView()
    }
}
