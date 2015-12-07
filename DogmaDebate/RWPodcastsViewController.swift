//
//  RWPodcastsViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/6/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWPodcastsViewController: UIViewController {
    
    var podCastsViewModel: RWPodcastsViewModel?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        podCastsViewModel =  RWPodcastsViewModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        podCastsViewModel = RWPodcastsViewModel()
    }
    
}

extension RWPodcastsViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RWHomeTableViewCell", forIndexPath: indexPath) as! RWHomeTableViewCell
        
        return cell
    }
    
}

extension RWPodcastsViewController: UITableViewDelegate {
    
}