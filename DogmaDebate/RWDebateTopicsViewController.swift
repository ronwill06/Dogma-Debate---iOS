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
    var selectedIndexPath: NSIndexPath?
    var cellIsDeselected = false
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Debate Topics"
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        
        debateTopicsViewModel = RWDebateTopicsViewModel()
        tableView.registerNib(UINib(nibName: "RWDebaterTopicTableViewCell", bundle: nil), forCellReuseIdentifier: "RWDebaterTopicTableViewCell")
    
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
        if let cell = tableView.dequeueReusableCellWithIdentifier("RWDebaterTopicTableViewCell", forIndexPath: indexPath) as? RWDebaterTopicTableViewCell {
        let topic = debateTopicsViewModel!.topicForIndex(indexPath.row)
        cell.questionLabel.text = topic.title
        cell.informationViewHeightConstraint.constant = 170
        cell.informationView.text = topic.information
        return cell
        }
        
        return genericCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if cellIsDeselected == false {
            if let selectedIndexPath = selectedIndexPath {
                if indexPath.compare(selectedIndexPath) == NSComparisonResult.OrderedSame {
                   return 200
                }
                
            }
        } else {
            return 50
        }
        
        return 50
    }
    
}

extension RWDebateTopicsViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        _ = tableView.cellForRowAtIndexPath(indexPath)
        
        selectedIndexPath = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if cellIsDeselected == false {
            cellIsDeselected = true
        } else {
            cellIsDeselected = false
        }
        
//        UIView.animateWithDuration(0.3) { () -> Void in
//             cell?.contentView.layoutIfNeeded()
//            tableView.beginUpdates()
//            cell?.contentView.frame.size.height = 100
//            tableView.endUpdates()
//        }
    }
}