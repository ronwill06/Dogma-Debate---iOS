//
//  RWEvolutionViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import UIKit

class RWEvolutionViewController: UIViewController {
    
    var evolutionViewModel: RWEvolutionViewModel?
    var selectedIndexPath: NSIndexPath?
    var cellIsDeselected = false
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Evolution Basics"
        navigationController?.navigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        
        
        let leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(RWPodcastPlayerViewController.dismiss))
        navigationController?.navigationItem.backBarButtonItem = leftBarButtonItem
        
        evolutionViewModel = RWEvolutionViewModel()
        tableView.registerNib(UINib(nibName: "RWDebaterTopicTableViewCell", bundle: nil), forCellReuseIdentifier: "RWDebaterTopicTableViewCell")
        
    }
}

extension RWEvolutionViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfItems = evolutionViewModel?.numberOfItems() {
            return numberOfItems
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let genericCell =  UITableViewCell()
        if let cell = tableView.dequeueReusableCellWithIdentifier("RWDebaterTopicTableViewCell", forIndexPath: indexPath) as? RWDebaterTopicTableViewCell {
            let topic = evolutionViewModel?.topicForIndex(indexPath.row)
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
                    return 200
                }
                
            }
        }
        
        return 50
    }
    
}

extension RWEvolutionViewController : UITableViewDelegate {
    
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
