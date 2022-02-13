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
    @Published var currentModuleindex : Int = 0
    
    @Published var currentLesson : Lessons?
    @Published var currentLessonIndex : Int = 0
    
    @Published var currentExplanation : NSAttributedString = NSAttributedString()
    
    var styleData : Data?
    
    @Published var homeTabIndex : Int?
    
    
    init()
    {
        self.learningList = LearnService.GetLearningList()
        self.styleData = LearnService.GetLearningStyle()
    }
    
    func setCurrentModule(contentID :Int)
    {
        
            self.currentModule = learningList[contentID]
            currentModuleindex = contentID
        
        
    }
    
    func setCurrentLesson(lessonID :Int)
    {
        if(lessonID < currentModule!.content.lessons.count)
        {
        
        self.currentExplanation = NSAttributedString()
        self.currentLesson = currentModule?.content.lessons[lessonID]
        currentLessonIndex = lessonID
        self.currentExplanation = setAttributedToString(htmlString: self.currentLesson!.explanation)
        }
        
    }
//    func setNextLesson(lessonID :Int)
//    {
//        
//        self.currentLesson = currentModule?.content.lessons[lessonID + 1]
//        currentLessonIndex = lessonID + 1
//        self.currentExplanation = setAttributedToString(htmlString: self.currentLesson!.explanation)
//        
//        
//    }
    
    func setAttributedToString(htmlString : String) -> NSAttributedString
    {
        
        var result = NSAttributedString()
        var dataT = Data()
        
        if styleData != nil
        {
            dataT.append(styleData!)
        }
        
        if (htmlString != "")
        {
            
        dataT.append(Data(htmlString.utf8))
       
//        do
//        {
//            let attributedString = try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
//            result = attributedString
//        }
//        catch
//        {
//            print(error)
//        }
        
        do {
            result =  try NSAttributedString(data: dataT, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
              } catch {
                  print("error:", error)
                  
              }
        
//        if let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil) {
//            result = attributedString
//        }
        }
//
       
        return result
    }
    
    
}
