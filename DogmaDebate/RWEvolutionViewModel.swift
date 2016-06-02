//
//  RWEvolutionViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWEvolutionViewModel {
    
    var evolutionTopics: [RWEvolutionObject] = []
    let htmlTags = ["</b>", "<br>", "&"]
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let path = NSBundle.mainBundle().pathForResource("evolution", ofType: "plist")
        
        if let path = path {
            let info = NSArray(contentsOfFile:path)
            
            if let evolutionInfo = info {
                for info in evolutionInfo {
                    if let object = info as? [String : String] {
                        let evolutionObject = RWEvolutionObject()
                        evolutionObject.title = object["menu"]
                        if let information = object["information"] {
                            
                            do {
                                let editedInformation = try NSAttributedString(data: information.dataUsingEncoding(NSUTF8StringEncoding)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                                evolutionObject.information = editedInformation
                            } catch {
                                print("Error w/\(information)")
                            }
                            
                        }
                        
                        evolutionTopics.append(evolutionObject)
                    }
                }
                
            }
        }
        
    }
    
    func numberOfItems() -> Int {
        return evolutionTopics.count
    }
    
    func topicForIndex(index: Int) -> RWEvolutionObject {
        let topic = evolutionTopics[index]
        return topic
    }
    

}