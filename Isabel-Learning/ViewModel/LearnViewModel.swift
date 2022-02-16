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
    @Published var homeTabTestIndex : Int?
    
    @Published var currentQuestion : Questions?
    @Published var currentQuestionIndex : Int = 0
    
    
    init()
    {
        //self.learningList = [Learn]()
       self.learningList = LearnService.GetLearningList()
        self.styleData = LearnService.GetLearningStyle()
        GetLearningListNetwork()
        
        
    }
    
    func setCurrentModule(contentID :Int)
    {
        
            self.currentModule = learningList[contentID]
            currentModuleindex = contentID
        
        
    }
    func setCurrentModuleQuestion(contentID :Int,currentQuest : Int )
    {
        
        self.currentModule = learningList[contentID]
        currentModuleindex = contentID
        if(currentModule!.test.questions.count > currentQuest)
        {
            self.currentQuestion = currentModule!.test.questions[currentQuest]
            self.currentQuestionIndex = currentQuest
            self.currentExplanation = setAttributedToString(htmlString: self.currentQuestion!.content)
        }
        else
        {
            currentQuestion = nil
            currentQuestionIndex = -1
        }
        
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
    
     func GetLearningListNetwork()
    {
        var learnList : [Learn] = [Learn]()
        
        //GET THE URL STRING PATH
        let urlString = "https://alvintobias.github.io/Isabel-Learning-Data/data2.json"
        
        //GET THE URL OBJECT
        let urlObject = URL(string: urlString)
        
        guard urlObject != nil else{
            return
        }
        
        //CREATE A URL REQUEST
        let request = URLRequest(url: urlObject!)
        
        
        //GET THE SESSION, Session handles the response , request
        
        let session = URLSession.shared
        
        //Session data return is data,response status, error
        let datatask = session.dataTask(with: request) { data, response, error in
//            //CHECK if there is any error
            guard error == nil else
            {
                return
            }
            
            //Handle the response
            
        
                
                let jsonLibraryDecoder = JSONDecoder()
                
                do
                {
                    learnList = try jsonLibraryDecoder.decode([Learn].self, from: data!)
                    self.learningList += learnList
                    //self.learningList.shuffle()
                }
                catch
                {
                    print(error)
                }
                
            
            
            
        }
        //Kick of the Datatask
        datatask.resume()
        
        
        
        
        
        
        
        
    }
    
    
}
