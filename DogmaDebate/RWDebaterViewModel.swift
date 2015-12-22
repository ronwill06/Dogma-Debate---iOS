//
//  RWDebaterViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/20/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWDebaterViewModel {
    
    var categoryNames = ["Debate Topics", "Evolution Basics", "Ask Creationists", "The Bible", "Smalley Quotes", "Drops"]
    
    func fetchData() {
        let atheismPath = NSBundle.mainBundle().pathForResource("atheism", ofType: "plist")
        let creationistsPath = NSBundle.mainBundle().pathForResource("creationists", ofType: "plist")
        let evolutionPath = NSBundle.mainBundle().pathForResource("evolution", ofType: "plist")
        let smalleyPath =  NSBundle.mainBundle().pathForResource("smalley", ofType: "plist")
        
        if let atheismPath = atheismPath {
            let atheismDict = NSDictionary(contentsOfFile: atheismPath)
        }
        
        if let creationistsPath = creationistsPath {
            let creationistDict = NSDictionary(contentsOfFile: creationistsPath)
        }
        
        if let evolutionPath = evolutionPath {
            let evolutionDict = NSDictionary(contentsOfFile: evolutionPath)
        }
        
        if let smalleyPath = smalleyPath {
            let smalleyDict =  NSDictionary(contentsOfFile: smalleyPath)
        }
    }
    
    func numberOfLists() -> Int {
        return categoryNames.count
    }
    
    func categoryNameAtIndex(index: Int) -> String {
        let categoryName = categoryNames[index]
        
        return categoryName
    }
    
    func viewControllerForIndex(index: Int) -> UIViewController {
        let debateTopicsViewController = RWDebateTopicsViewController()
        
        let viewControllers = [debateTopicsViewController]
        let viewController = viewControllers[index]
        
        return viewController
    }
    
}