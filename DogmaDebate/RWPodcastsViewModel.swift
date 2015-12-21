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
    var podcasts: [RWPodcast] = []
    
    override init() {
        super.init()
        //_ = DDPodcastOperation()
        fetchData()
        
        tabBarTitle = "Podcasts"
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func fetchData() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "podcastData:", name:DDPodcastOperation.PodcastOperationDidSucceed,
            object: nil)
    }
    
    func podcastData(notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String : [AnyObject]] {
            if let podcasts = userInfo["podCastInfo"] as? [RWPodcast] {
                self.podcasts = podcasts
            }
        }
    }
    
    func cellViewModelAtIndex(index: Int) -> RWPodcastCellViewModel {
        let cellViewModel = RWPodcastCellViewModel()
        //cellViewModel.podcast = podcasts[index]
        
        return cellViewModel
    }
    
    func numberOfItemsInSection() -> Int {
        print(self.podcasts.count)
        return podcasts.count
    }
    
}