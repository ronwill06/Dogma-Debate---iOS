//
//  FourthListenerViewController.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/1/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class FourthListenerViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var fourthListenerViewModel: FourthListenerViewModel? {
        didSet {
            
         }
    }
    
    static func fourthListenerViewController() -> FourthListenerViewController {
        let vc = UIStoryboard(name: "FourthListenerViewController", bundle: nil).instantiateInitialViewController() as! FourthListenerViewController
        return vc
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "4th"
        fourthListenerViewModel?.update = {
            self.tableView.reloadData()
        }
    }
    
}

extension FourthListenerViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = fourthListenerViewModel else { return 0}
        return viewModel.numberOfItemsInSection()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let viewModel = fourthListenerViewModel else { return UITableViewCell() }
        let cell =  tableView.dequeueReusableCellWithIdentifier("FourthListenerCell", forIndexPath: indexPath) as! FourthListenerTableViewCell
        cell.titleLabel.text = viewModel.titleForPodcastAtIndex(indexPath.row)
        cell.descriptionView.text = viewModel.descriptionForPodcast(indexPath.row)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130.0
    }
}

extension FourthListenerViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard let viewModel = fourthListenerViewModel else { return }
        let podcast = viewModel.podcastForIndex(indexPath.row)
            let podcastPlayerVC = RWPodcastPlayerViewController()
            podcastPlayerVC.podcast = podcast
            navigationController?.pushViewController(podcastPlayerVC, animated: true)
    }
}
