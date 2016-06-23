//
//  RWDebaterViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/20/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWDebaterViewModel: NSObject {
    
    var categoryNames = ["Debate Topics", "Evolution Basics", "Ask Creationists", "The Bible", "Smalley Quotes", "Drops"]
    
    func fetchData() {
        
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
        let evolutionBasicViewController = RWEvolutionViewController()
        let askCreationistsViewController = RWAskCreationistsViewController()
        let bibleViewController = RWBibleViewController.bibleViewController()
        let smalleyQuotesViewController = RWQuotesViewController()
        let dropsViewController = RWDropsViewController()
        
        let viewControllers = [debateTopicsViewController, evolutionBasicViewController, askCreationistsViewController, bibleViewController, smalleyQuotesViewController, dropsViewController]
        let viewController = viewControllers[index]
        
        return viewController
    }
    
}