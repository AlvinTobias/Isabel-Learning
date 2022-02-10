//
//  Learn.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/1/22.
//

import Foundation
class Learn : Decodable,Identifiable{
    
    var id : Int
    var category : String
    var content : Content
    var test : Test
}

class Content : Decodable,Identifiable
{
    var id : Int
    var image : String
    var time : String
    var description : String
    var lessons : [Lessons]
    
}
class Lessons : Decodable,Identifiable{
    
    var id : Int
    var title : String
    var video : String
    var duration : String
    var explanation : String
}
class Test : Decodable,Identifiable
{
    var id : Int
    var image : String
    var time : String
    var description : String
    var questions : [Questions]
    
}
class Questions : Decodable,Identifiable{
    
    var id : Int
    var content : String
    var correctIndex : Int
    var answers : [String]
}
