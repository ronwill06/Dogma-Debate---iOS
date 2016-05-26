//
//  RWDebateTopicsViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/21/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWDebateTopicsViewModel {
    
    var atheismTopics: [RWAtheismObject] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let atheismPath = NSBundle.mainBundle().pathForResource("atheism", ofType: "plist")
        
        if let atheismPath = atheismPath {
            let atheismInfo = NSArray(contentsOfFile:atheismPath)
            
            if let atheismInfo = atheismInfo {
                for info in atheismInfo {
                    if let object = info as? [String:String] {
                        let atheismObject = RWAtheismObject()
                        atheismObject.title = object["menu"]
                        
                        if let information = object["information"] {
                            do {
                                let editedInformation = try NSAttributedString(data: information.dataUsingEncoding(NSUTF8StringEncoding)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                                 atheismObject.information = editedInformation
                            } catch {
                                print("Error w/\(information)")
                            }
                        }
                        

                        
                        atheismTopics.append(atheismObject)
                    }
                }
                
            }
        }

    }
    
    func numberOfItems() -> Int {
        return atheismTopics.count
    }
    
    func topicForIndex(index: Int) -> RWAtheismObject {
        let topic = atheismTopics[index]
        
        return topic
    }
    
    
}
