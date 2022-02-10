//
//  LessonList.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/7/22.
//

import SwiftUI

struct LessonList: View {
    
    @EnvironmentObject var learnList : LearnViewModel
    
    var body: some View {
       
            
        
        
        ScrollView{
            LazyVStack
            {
                if(learnList.currentModule != nil)
                {
               ForEach(learnList.currentModule!.content.lessons){
               // ForEach(learnList.learningList[0].content.lessons){
                    Lessondetail in
                   NavigationLink(destination:
                       
                       LessonDetail()
                           .onAppear {
                               learnList.setCurrentLesson(lessonID: Lessondetail.id)
                           }
                       
                   ,label: {
                       ZStack
                       {
                           Rectangle()
                               .foregroundColor(.white)
                               .cornerRadius(10)
                               .frame(width: 335, height: 80, alignment: .center)
                               .shadow(radius: 5)
                           HStack(alignment: .top)
                           {
                               Text(String(Lessondetail.id + 1 ))
                                   .padding()
                             
                               VStack(alignment: .leading)
                               {
                                   Text(Lessondetail.title).font(.title3).bold()
                                   Spacer()
                                   HStack
                                   {
                                       Text("Video -").font(.caption)
                                       Text(Lessondetail.duration).font(.caption)
                                   }
                                   
                                   Spacer()
                               }
                               .padding(.leading,20)
                               Spacer()
                           }
                           .padding()
                       }
                       .padding([.leading,.trailing],5)
                   })
                  
                   //.navigationBarHidden(true)
                   //.navigationBarTitle("", displayMode: .inline)
                   .accentColor(.black)
                   
                    
                    
                   
                }
                    
                }
                  
                
            }
            .navigationBarTitle("", displayMode: .inline)
            
            }
        
       
    }
}

struct LessonList_Previews: PreviewProvider {
    static var previews: some View {
        LessonList().environmentObject(LearnViewModel())
    }
}
