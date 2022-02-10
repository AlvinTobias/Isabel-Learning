//
//  LearnViewModel.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/3/22.
//

import Foundation
class LearnViewModel : ObservableObject
{
    @Published var learningList : [Learn]
    
    @Published var currentModule : Learn?
    @Published var currentModuleindex : Int?
    
    @Published var currentLesson : Lessons?
    @Published var currentLessonIndex : Int?
    
    
    init()
    {
        self.learningList = LearnService.GetLearningList()
    }
    
    func setCurrentModule(contentID :Int)
    {
        
            self.currentModule = learningList[contentID]
            currentModuleindex = contentID
        
        
    }
    
    func setCurrentLesson(lessonID :Int)
    {
        
        self.currentLesson = currentModule?.content.lessons[lessonID]
        currentLessonIndex = lessonID
        
        
    }
    
    
}
