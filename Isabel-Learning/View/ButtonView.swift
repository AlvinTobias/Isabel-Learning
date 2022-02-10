//
//  ButtonView.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/10/22.
//

import SwiftUI

struct ButtonView: View {
    var buttonText : String = ""
    var buttonForeColor : Color = Color.white
    var body: some View {
        
        
        ZStack
        {
            Rectangle()
                .foregroundColor(buttonForeColor)
                .cornerRadius(10)
            Text(buttonText)
        }
        .frame(width: 300, height: 75, alignment: .center)
        
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
