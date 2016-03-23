//
//  RWFourthListenerViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 3/3/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation


@objc class RWFourthListenerViewModel: NSObject {
    
    var podcastData: [RWPodcast] = [RWPodcast]()
    var tableView: UITableView?
    
    func fetchData() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "handleFourthListenerContent:", name: RWOAuthManager.FourthPodcastOperationDidUpdate, object: nil)
    }
    
    func handleFourthListenerContent(notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String : [RWPodcast]]{
            if let podcasts = userInfo["fourthPodcasts"] {
                podcastData = podcasts
                tableView?.reloadData()
            }
        }
    }
    
}