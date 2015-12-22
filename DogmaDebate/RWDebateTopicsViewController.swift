//
//  RWDebateTopicsViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/21/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWDebateTopicsViewController : UIViewController {
    
    var debateTopicsViewModel: RWDebateTopicsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Debate Topics"
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        
        debateTopicsViewModel = RWDebateTopicsViewModel()
    }
}

extension RWDebateTopicsViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfItems = debateTopicsViewModel?.numberOfItems() {
            return numberOfItems
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let genericCell =  UITableViewCell()
        if let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath) as? UITableViewCell {
        let topic = debateTopicsViewModel!.topicForIndex(indexPath.row)
        return cell
        }
        
        return genericCell
    }
}