//
//  ContentView.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/1/22.
//

import SwiftUI

struct LibraryHome: View {
    
    //@ObservedObject var learnList: LearnViewModel = LearnViewModel()
    
    @EnvironmentObject var learnList : LearnViewModel
   
    
    var body: some View {
        
        NavigationView
        {
            
            ScrollView
            {
                VStack(alignment: .leading)
                {
                    Text("What do you want to do today?")
                        .padding(.leading,20)
                  
                
                LazyVStack
                {
                    ForEach(learnList.learningList){ modeule in
                        
//                        NavigationLink (destination:
//                            LessonList()
//                                            .onAppear(perform: {
//                            learnList.setCurrentModule(contentID: modeule.id)
//                        })
//                        ,label: {
//
//                            Card(image: modeule.content.image, title: modeule.category + " Learn", description: modeule.content.description, lesson: String(modeule.content.lessons.count) + " Lessons", time: modeule.content.time)
//                        })
//
                       

//                        NavigationLink {
//                            LessonList()
//                                .onAppear {
//                                    learnList.setCurrentModule(contentID: modeule.id)
//                                }
//                            
//                        } label: {
//                            Card(image: modeule.content.image, title: modeule.category + " Learn", description: modeule.content.description, lesson: String(modeule.content.lessons.count) + " Lessons", time: modeule.content.time)
//                        }
                        
                        NavigationLink(tag: modeule.id, selection: $learnList.homeTabIndex) {
                            LessonList()
                                .onAppear {
                                    learnList.setCurrentModule(contentID: modeule.id)
                                }
                        } label: {
                            Card(image: modeule.content.image, title: modeule.category + " Learn", description: modeule.content.description, lesson: String(modeule.content.lessons.count) + " Lessons", time: modeule.content.time)
                        }


                        
                        Card(image: modeule.test.image, title: modeule.category + " Test", description: modeule.test.description, lesson: String(modeule.test.questions.count)+" Questions", time: modeule.test.time)
                        
                    }
                    
                }
            }
                
            }
            .navigationTitle("Let's Get Started")
            .accentColor(Color.black)
            
           
            
        }
        .navigationViewStyle(.stack)
      
        
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryHome().environmentObject(LearnViewModel())
    }
}
