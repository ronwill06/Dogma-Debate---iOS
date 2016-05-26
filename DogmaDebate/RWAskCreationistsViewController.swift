//
//  RWAskCreationistsViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import UIKit

class RWAskCreationistsViewController: UIViewController {
    
    var askCreationistsViewModel: RWAskCreationistsViewModel?
    var selectedIndexPath: NSIndexPath?
    var cellIsDeselected = false
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ask Creationists"
        navigationController?.navigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        
        let leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(RWPodcastPlayerViewController.dismiss))
        navigationItem.backBarButtonItem = leftBarButtonItem
        
        askCreationistsViewModel = RWAskCreationistsViewModel()
        tableView.registerNib(UINib(nibName: "RWDebaterTopicTableViewCell", bundle: nil), forCellReuseIdentifier: "RWDebaterTopicTableViewCell")
        
    }
}

extension RWAskCreationistsViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfItems = askCreationistsViewModel?.numberOfItems() {
            return numberOfItems
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let genericCell =  UITableViewCell()
        if let cell = tableView.dequeueReusableCellWithIdentifier("RWDebaterTopicTableViewCell", forIndexPath: indexPath) as? RWDebaterTopicTableViewCell {
            let topic = askCreationistsViewModel?.topicForIndex(indexPath.row)
            cell.questionLabel.text = topic?.title
            cell.informationViewHeightConstraint.constant = 170
            cell.informationView.attributedText = topic?.information
            return cell
        }
        
        return genericCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if cellIsDeselected == false {
            if let selectedIndexPath = selectedIndexPath {
                if indexPath.compare(selectedIndexPath) == NSComparisonResult.OrderedSame {
                    return 250
                }
                
            }
        }
        
        return 50
    }
    
}

extension RWAskCreationistsViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        selectedIndexPath = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
        
        if cellIsDeselected == false {
            cellIsDeselected = true
        } else {
            cellIsDeselected = false
        }
        
    }
}

