//
//  ContentModel.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/21/21.
//

import Foundation

class ContentModel: ObservableObject {
    @Published var modules = [Module]()
    @Published var currentModule: Module?
    @Published var currentModuleIndex: Int?
    @Published var currentLesson: Lesson?
    @Published var currentDescription: NSAttributedString?
    var currentLessonIndex: Int?
    var styleData: Data?
    
    init() {
        getModules()
        getStyleData()
    }
    
    func getModules() {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")
        do {
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            self.modules = try decoder.decode([Module].self, from: data)
        } catch {
            print(error)
        }
    }
    
    func getStyleData() {
        let url = Bundle.main.url(forResource: "style", withExtension: "html")
        do {
            self.styleData = try Data(contentsOf: url!)
        } catch {
            print(error)
        }
    }
    
    func beginModule(_ index: Int) {
        self.currentModule = modules[index]
        self.currentModuleIndex = index
    }
    
    func beginLesson(_ index: Int) {
        self.currentLesson = self.currentModule?.content.lessons[index]
        self.currentLessonIndex = index
        self.currentDescription = styleText(self.currentLesson!.explanation)
    }
    
    func hasNextLesson() -> Bool {
        return self.currentLessonIndex! + 1 < self.currentModule!.content.lessons.count
    }
    
    func styleText(_ htmlString: String) -> NSAttributedString {
        var resultString = NSAttributedString()
        var data = Data()
        if self.styleData != nil {
            data.append(self.styleData!)
        }
        data.append(Data(htmlString.utf8))
        if let attributedString = try? NSAttributedString(
            data: data,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil
        ) {
            resultString = attributedString
        }
        return resultString
    }
}
