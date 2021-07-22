//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Christopher Plain on 7/21/21.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
