//
//  RWQuotesViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import UIKit


class RWQuotesViewController: UIViewController {
    
    var quotesViewModel: RWQuoteViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Smalley Quotes"
        navigationController?.navigationBarHidden = false
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        
        let leftBarButtonItem = UIBarButtonItem(title: "Back", style: .Plain, target: self, action: #selector(RWPodcastPlayerViewController.dismiss))
        navigationItem.backBarButtonItem = leftBarButtonItem
        
        quotesViewModel = RWQuoteViewModel()
        tableView.registerNib(UINib(nibName: "RWQuoteTableViewCell", bundle: nil), forCellReuseIdentifier: "RWQuoteTableViewCell")
        
    }
}

extension RWQuotesViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let numberOfItems = quotesViewModel?.numberOfItems() {
            return numberOfItems
        }
        
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let genericCell =  UITableViewCell()
        if let cell = tableView.dequeueReusableCellWithIdentifier("RWQuoteTableViewCell", forIndexPath: indexPath) as? RWQuoteTableViewCell {
            let topic = quotesViewModel?.topicForIndex(indexPath.row)
            cell.quoteLabel.text = topic?.quote
            return cell
        }
        
        return genericCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
}

