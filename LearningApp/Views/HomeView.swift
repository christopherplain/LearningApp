//
//  ContentView.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/21/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                // MARK: Greeting
                Text("What would you like to do today?")
                    .padding(.leading, 20)
                
                // MARK: Modules
                ScrollView {
                    LazyVStack {
                        ForEach(model.modules.indices, id: \.self) { index in
                            let module = model.modules[index]
                            VStack(spacing: 20) {
                                
                                // MARK: Lesson card
                                NavigationLink(
                                    destination: LessonListView()
                                        .onAppear { model.beginModule(index) },
                                    tag: index,
                                    selection: $model.lessonLinkSelected
                                ) {
                                    HomeCardView(
                                        image: module.content.image,
                                        title: "Learn \(module.category)",
                                        description: module.content.description,
                                        count: "\(module.content.lessons.count) Lessons",
                                        time: (module.content.time)
                                    )
                                }
                                
                                // MARK: Test card
                                NavigationLink(
                                    destination: TestView()
                                        .onAppear { model.beginTest(index) },
                                    tag: index,
                                    selection: $model.testLinkSelected
                                ) {
                                    HomeCardView(
                                        image: module.test.image,
                                        title: "\(module.category) Test",
                                        description: module.test.description,
                                        count: "\(module.test.questions.count) Questions",
                                        time: (module.test.time)
                                    )
                                }
                                
                                // Fix for 14.5 NavigationLink issue
                                NavigationLink(destination: EmptyView()) {
                                    EmptyView()
                                }
                            }
                            .accentColor(.black)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Get Started")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(ContentModel())
    }
}
