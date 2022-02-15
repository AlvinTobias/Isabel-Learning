//
//  QuestionList.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/13/22.
//

import SwiftUI
import CoreMIDI


struct QuestionList: View {
    @EnvironmentObject var learnList : LearnViewModel
    @State var CurrentQuestion : Int = 0
    
    @State var answerSelected : Int = -1
    @State var disableSelection = false
    @State var answerCorrect = false
    
    @State var myScore : Int = 0
    
    @State var nextQuestion = "Submit"
    
    var body: some View {
        
        VStack
        {
            VStack{
                if(learnList.currentQuestion != nil)
                {
                    Text("Question \(learnList.currentQuestionIndex + 1) of \(learnList.currentModule?.test.questions.count ?? 0)")
                    VStack
                    {
                        LessonExplanation()
                            .foregroundColor(.green)
                    }
                     VStack
                        {
                            ForEach(0..<learnList.currentQuestion!.answers.count, id: \.self){ questionIndex in
                            
                            VStack{
                                
                                Button {
                                    answerSelected = questionIndex
                                    
                                } label: {
                                    ButtonView(buttonText: learnList.currentQuestion!.answers[questionIndex],
                                               buttonForeColor:
//                                                answerSelected != questionIndex ? .white :
//                                                answerSelected == questionIndex && disableSelection == false ? .gray :
//                                                answerSelected == questionIndex && disableSelection == true && answerSelected == learnList.currentQuestion!.correctIndex ? .green : .red
                                            answerSelected == questionIndex && disableSelection == false ? .gray :
                                            disableSelection == true && questionIndex == learnList.currentQuestion!.correctIndex ? .green :
                                                disableSelection == true && answerSelected == questionIndex ?.red : .white
                                               
                                    )
                                               
                                        .shadow(radius: 20)
                                }

                                
                            }
                            
                            }
                        .disabled(disableSelection)
                        }
                        .padding(.bottom,20)
                      
                  
                    
                    Spacer()
                  
                    Button {
                        if(nextQuestion == "Next Question")
                        {
                            
                            disableSelection = false
                            answerSelected = -1
                            nextQuestion = "Submit"
                            answerCorrect = false
                            learnList.setCurrentModuleQuestion(contentID: learnList.currentModuleindex, currentQuest: learnList.currentQuestionIndex + 1)
                            
                            
                        }
                        else if(nextQuestion == "Check Your Score.")
                        {
                            disableSelection = false
                            answerSelected = -1
                            nextQuestion = "Submit"
                            answerCorrect = false
                            learnList.setCurrentModuleQuestion(contentID: learnList.currentModuleindex, currentQuest: learnList.currentQuestionIndex + 1)
                        }
                        else
                        {
                            disableSelection = true
                            if(answerSelected == learnList.currentQuestion!.correctIndex)
                            {
                                answerCorrect = true
                                myScore += 1
                                
                            }
                            if(learnList.currentQuestionIndex + 1  == learnList.currentModule?.test.questions.count ?? 0)
                            {
                                nextQuestion = "Check Your Score."
                               
                            }
                            else
                            {
                                nextQuestion = "Next Question"
                            }
                        }
                                             
                    } label: {
                       
                        ButtonView(buttonText: nextQuestion, buttonForeColor: .green)
                            
                    }
                    
                    
                }
                else
                {
                 
                    if (myScore < 3)
                    {
                        Text("Tell your parents to buy some buffolo instead of paying for your studies..!")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                    else if (myScore >= 3 && myScore < 5)
                    {
                        Text("Hmm..Please study again...!").font(.title)
                            .foregroundColor(.red)
                    }
                    else if (myScore >= 5 && myScore < 8)
                    {
                        Text("Ok.. Needs to Work Hard...!").font(.title)
                            .foregroundColor(.yellow)
                    }
                    else if (myScore >= 8 && myScore < 10)
                    {
                        Text("Good Job..").font(.title)
                            .foregroundColor(.green)
                    }
                    else
                    {
                        Text("Excellent..").font(.title)
                            .foregroundColor(.blue)
                    }
                        
                    Text("Your Score is ...\(myScore) out of \(learnList.currentModule?.test.questions.count ?? 0)")
                        .font(.title)
                        .foregroundColor(.purple)
                }
            }
            .accentColor(.black)
            Spacer()
            
        }
    }
}

struct QuestionList_Previews: PreviewProvider {
    static var previews: some View {
        QuestionList().environmentObject(LearnViewModel())
    }
}
