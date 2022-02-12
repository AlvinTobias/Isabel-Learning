//
//  LessonExplanation.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/12/22.
//

import SwiftUI

struct LessonExplanation: UIViewRepresentable {
    
    @EnvironmentObject var learnList : LearnViewModel
    
    func makeUIView(context: Context) -> UITextView
    {
        
        let lessonExp = UITextView()
        lessonExp.isEditable = false
        
        lessonExp.attributedText = learnList.currentExplanation
        
        return lessonExp
        
    }
    
    func updateUIView(_ textView : UIViewType, context: Context)
    {
        textView.attributedText = learnList.currentExplanation
        textView.scrollsToTop = true
        
        textView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 5, height: 5), animated: false)
    }
    
}

struct LessonExplanation_Previews: PreviewProvider {
    static var previews: some View {
        LessonExplanation()
    }
}
