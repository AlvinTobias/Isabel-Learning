//
//  LessonDetail.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/9/22.
//

import SwiftUI
import AVKit

struct LessonDetail: View {
    @EnvironmentObject var learnList : LearnViewModel
    @State var lessonEnd : Bool = false
  
    
    var body: some View {
        
        VStack
        {
            if(learnList.currentLesson != nil)
            {
                
                
            Text(learnList.currentLesson!.title)
           let urllink = URL(string: "https://www.youtube.com/watch?v=qZjLORfD4ZA")
            VideoPlayer(player: AVPlayer(url: urllink!))
                if(learnList.currentExplanation.length > 0)
                {
                   
                    LessonExplanation()
                
                        
                }
                
                Button {
                    
                    learnList.setCurrentLesson(lessonID: learnList.currentLesson!.id+1)
                     if(learnList.currentLesson!.id+1 >= learnList.currentModule!.content.lessons.count)
                    {
                        lessonEnd = true
                    }
                 
                }
                
                
                
            label: {
                    if(lessonEnd == false)
                    {
                        ButtonView(buttonText: "Next Lesson", buttonForeColor: Color.green)
                    }
                }
            .onAppear {
                validNextButton()
               
            }
            
            Spacer()
            }
            
        }
        
    }
    
    func validNextButton()
    {
        if(learnList.currentLesson!.id+1 == learnList.currentModule!.content.lessons.count)
        {
            lessonEnd = true
        }
        
        
        
    }
    
   
        
}

struct LessonDetail_Previews: PreviewProvider {
    static var previews: some View {
        LessonDetail().environmentObject(LearnViewModel())
    }
}
