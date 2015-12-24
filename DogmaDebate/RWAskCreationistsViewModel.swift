//
//  RWAskCreationistsViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWAskCreationistsViewModel {
    
    var creationistTopics: [RWCreationistObject] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let path = NSBundle.mainBundle().pathForResource("creationists", ofType: "plist")
        
        if let path = path {
            let info = NSArray(contentsOfFile:path)
            
            if let creationistInfo = info {
                for info in creationistInfo {
                    if let object = info as? [String : String] {
                        let creationistObject = RWCreationistObject()
                        creationistObject.title = object["menu"]
                        creationistObject.information = object["information"]
                        
                        creationistTopics.append(creationistObject)
                    }
                }
                
            }
        }
        
    }
    
    func numberOfItems() -> Int {
        return creationistTopics.count
    }
    
    func topicForIndex(index: Int) -> RWCreationistObject {
        let topic = creationistTopics[index]
        
        return topic
    }
    

}