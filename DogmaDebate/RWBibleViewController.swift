//
//  RWBibleViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/21/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWBibleViewController : UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var bibleViewModel: RWBibleViewModel? {
        didSet {
            
        }
    }
    var selectedIndexPath: NSIndexPath?
    var cellIsDeselected = false
    
   
    static func bibleViewController() -> RWBibleViewController {
        let vc = UIStoryboard(name: "RWBibleViewController", bundle: nil).instantiateInitialViewController() as! RWBibleViewController
        return vc
    }
    
    override func viewDidLoad() {
        self.title = "Bible Contradictions"
        navigationController?.navigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false

        bibleViewModel = RWBibleViewModel()
        tableView.registerNib(UINib(nibName: "RWDebaterTopicTableViewCell", bundle: nil), forCellReuseIdentifier: "RWDebaterTopicTableViewCell")
        
        let leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(RWPodcastPlayerViewController.dismiss))
        navigationItem.backBarButtonItem = leftBarButtonItem
    }
}

extension RWBibleViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfItems = bibleViewModel?.numberOfItems() else { return 0}
        return numberOfItems
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = UITableViewCell()
        if let cell = tableView.dequeueReusableCellWithIdentifier("RWDebaterTopicTableViewCell", forIndexPath: indexPath) as? RWDebaterTopicTableViewCell {
            let topic = bibleViewModel?.topicForIndex(indexPath.row)
            cell.questionLabel.text = topic?.question
            cell.informationView.attributedText = topic?.description
            cell.informationViewHeightConstraint.constant = 170
            return cell
        }

        return tableViewCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if cellIsDeselected == false {
            if let selectedIndexPath = selectedIndexPath {
                if indexPath.compare(selectedIndexPath) == NSComparisonResult.OrderedSame {
                    return 200
                }
                
            }
        }
        
        return 50
    }

   
}

extension RWBibleViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPath = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if cellIsDeselected == false {
            cellIsDeselected = true
        } else {
            cellIsDeselected = false
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
}