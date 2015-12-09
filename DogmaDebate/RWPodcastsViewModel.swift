//
//  RWPodcastsViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/6/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWPodcastsViewModel: NSObject, DogmaDebateProtocol {
    
    var tabBarTitle: String?
    var podCasts: [RWPodcast] = [RWPodcast]()
    
    override init() {
        super.init()
        _ = DDPodcastOperation()
        fetchData()
        
        tabBarTitle = "Podcasts"
    }
    
    
    func fetchData() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "podcastData:", name:DDPodcastOperation.PodcastOperationDidSucceed,
            object: nil)
    }
    
   func podcastData(notification: NSNotification) {
    if let userInfo = notification.userInfo as? [String : [AnyObject]] {
        podCasts =  (userInfo["podCastInfo"] as? [RWPodcast])!
        
        }
    }
    
    func viewModelAtIndex(index: Int) {
        
    }
}