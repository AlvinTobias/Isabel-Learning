//
//  Card.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/6/22.
//

import SwiftUI

struct Card: View {
    
    var image : String
    var title : String
    var description : String
    var lesson : String
    var time : String
    
    var body: some View {
       
        ZStack
        {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
               .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
             
            HStack
            {
             
                Image(image).resizable()
                    .frame(width: 116, height: 116, alignment: .center)
                    .clipShape(Circle())
                Spacer()
                VStack(alignment: .leading){
                    Spacer()
                    Text(title).bold()
                        .padding(.bottom,10)
                 
                    Text(description).font(.caption)
                  
                    HStack{
                        Image(systemName: "menucard")
                        Text(lesson).font(.caption2)
                        Spacer()
                        Image(systemName: "hourglass")
                        Text(time).font(.caption2)
                        Spacer()
                    }
                    .padding(.top,20)
                    Spacer()
                    
                 
                }
           
               
               
            }
            .padding()
        
        }
        .padding()
    }
    
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(image: "swift", title: "Test SwiftUI", description: "Hello", lesson: "30 Lessons", time: "4 Hours")
    }
}
