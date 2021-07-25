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
    var currentModuleIndex: Int?
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
}
