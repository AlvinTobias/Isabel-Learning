//
//  Isabel_LearningApp.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/1/22.
//

import SwiftUI

@main
struct Isabel_LearningApp: App {
    var body: some Scene {
        WindowGroup {
            LibraryHome().environmentObject(LearnViewModel())
        }
    }
}
