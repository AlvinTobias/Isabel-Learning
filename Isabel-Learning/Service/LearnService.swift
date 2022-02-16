//
//  LearnService.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/3/22.
//

import Foundation
class LearnService
{
    
    static func GetLearningStyle()-> Data
    {
        var dtStyle = Data()
        //GET THE BUNDLE PATH
        let pathStyle = Bundle.main.path(forResource: "style", ofType: "html")
        
        guard(pathStyle != nil) else
        {
            return dtStyle
        }
        
        //GET THE URL PATH
        let urlPathStyle = URL.init(fileURLWithPath: pathStyle!)
        
        do
        {
            dtStyle = try Data(contentsOf: urlPathStyle)
            
        }
        
        //GET THE DECODE OBJECT
        catch
        {
            print(error)
        }
        
        return dtStyle
        
        
    }
    static func GetLearningList()-> [Learn]
    {
        var learnList : [Learn] = [Learn]()
        
        //GET THE BUNDLE PATH
        let path = Bundle.main.path(forResource: "data", ofType: "json")
        
        guard(path != nil) else
        {
            return learnList
        }
        
        //GET THE URL PATH
        let urlPath = URL.init(fileURLWithPath: path!)
        
        do
        {
            let libraryData = try Data(contentsOf: urlPath)
        //GET THE DATA OBJET
             let jsonLibraryDecoder = JSONDecoder()
            
            do
            {
                learnList = try jsonLibraryDecoder.decode([Learn].self, from: libraryData)
                return learnList
            }
            catch
            {
                print(error)
            }
            
        }
        
        
        //GET THE DECODE OBJECT
        catch
        {
            print(error)
        }
        
        
        return learnList
        
    }
    
//    static func GetLearningListNetwork()-> [Learn]
//    {
//        var learnList : [Learn] = [Learn]()
//        
//        //GET THE URL STRING PATH
//        let urlString = "https://alvintobias.github.io/Isabel-Learning-Data/data2.json"
//        
//        //GET THE URL OBJECT
//        let urlObject = URL(string: urlString)
//        
//        guard urlObject != nil else{
//            return learnList
//        }
//        
//        //CREATE A URL REQUEST
//        let request = URLRequest(url: urlObject!)
//        
//        
//        //GET THE SESSION, Session handles the response , request
//        
//        let session = URLSession.shared
//        
//        //Session data return is data,response status, error
//        let datatask = session.dataTask(with: request) { data, response, error in
//            //CHECK if there is any error
////            guard error != nil else
////            {
////                return
////            }
//            
//            //Handle the response
//            
//        
//                
//                let jsonLibraryDecoder = JSONDecoder()
//                
//                do
//                {
//                    learnList = try jsonLibraryDecoder.decode([Learn].self, from: data!)
//                    
//                }
//                catch
//                {
//                    print(error)
//                }
//                
//            
//            
//            
//        }
//        //Kick of the Datatask
//        datatask.resume()
//        
//        
//        
//        
//        
//        
//        
//        return learnList
//    }
}
