//
//  RWDropsViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/6/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWDropsViewModel {
    
    var drops: [RWDrop] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        let path = NSBundle.mainBundle().pathForResource("sounds", ofType: "plist")
        
        if let path = path {
            let info = NSArray(contentsOfFile:path)
            
            if let dropInfo = info {
                for info in dropInfo {
                    let title = info as? NSString
                    let newTitle = title?.stringByReplacingOccurrencesOfString("\t", withString: "")
                        let drop = RWDrop(title:newTitle)
                        drops.append(drop)
                    
                }
                
            }
        }
    }
    
    func numberOfItems() -> Int {
        return drops.count
    }
    
    func titleForIndex(index: Int) -> NSString {
        if let title = drops[index].title {
            return title
        }
        return ""
    }
    
}
