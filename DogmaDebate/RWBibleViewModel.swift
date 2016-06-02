//
//  RWBibleViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/21/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWBibleViewModel {
    var bibleObjects: [RWBibleObject] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let path = NSBundle.mainBundle().pathForResource("contradictions", ofType: "plist")
        
        if let path = path {
            let info = NSArray(contentsOfFile:path)
            
            if let contradictonList = info {
                for contradiction in contradictonList {
                    var bibleObject = RWBibleObject()
                    if let question = contradiction["main"] as? String, information = contradiction["main2"] as? String, description = contradiction["main3"] as? String {
                        bibleObject.question = question
                        bibleObject.information = information
                        
                        do {
                            let editedInformation = try NSAttributedString(data: description.dataUsingEncoding(NSUTF8StringEncoding)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                             bibleObject.description = editedInformation
                        } catch {
                            print("Error w/\(information)")
                        }

                        bibleObjects.append(bibleObject)
                        
                    }
                }
            }
        }
    }
    
    
    func numberOfItems() -> Int {
        return bibleObjects.count
    }
    
    
    func topicForIndex(index: Int) -> RWBibleObject {
        let topic = bibleObjects[index]
        
        return topic
    }
    
    
}