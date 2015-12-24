//
//  RWQuoteViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWQuoteViewModel {
    
    var quotes: [RWQuoteObject] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let path = NSBundle.mainBundle().pathForResource("smalley", ofType: "plist")
        
        if let path = path {
            let info = NSArray(contentsOfFile:path)
            
            if let quoteList = info {
                for info in quoteList {
                    var quote = RWQuoteObject()
                    quote.quote = info as? String
                    
                    quotes.append(quote)
                }
            }
            
        }
    }
    
    
    func numberOfItems() -> Int {
        return quotes.count
    }
    
    
    func topicForIndex(index: Int) -> RWQuoteObject {
        let topic = quotes[index]
        
        return topic
    }
    

}