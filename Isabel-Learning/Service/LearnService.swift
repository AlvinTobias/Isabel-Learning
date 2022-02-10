//
//  LearnService.swift
//  Isabel-Learning
//
//  Created by Jainy Alvin on 2/3/22.
//

import Foundation
class LearnService
{
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
}
