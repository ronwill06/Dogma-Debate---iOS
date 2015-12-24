//
//  RWPodcastsViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/6/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import UIKit

class RWPodcastsViewModel: NSObject, DogmaDebateProtocol {
    
    var tabBarTitle: String?
    var podcasts = [RWPodcast]()
    var collectionViewReference: UICollectionView?
    
    override init() {
        super.init()
        tabBarTitle = "Podcasts"
        fetchData()
       
    }
    
    func fetchData() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "podcastData:", name:DDPodcastOperation.PodcastOperationDidSucceed,
            object: nil)
        _ = DDPodcastOperation()
    }
    
    func podcastData(notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String : [AnyObject]] {
            if let podcasts = userInfo["podcastInfo"] as? [RWPodcast] {
                self.podcasts = podcasts
                if let collectionView = self.collectionViewReference {
                    collectionView.reloadData()
                }
            }
        }
    }
    
    func cellViewModelAtIndex(index: Int) -> RWPodcastCellViewModel {
        let cellViewModel = RWPodcastCellViewModel()
        cellViewModel.podcast = podcasts[index]
        
        return cellViewModel
    }
    
    func podcastAtIndex(index: Int) -> RWPodcast {
        let podcast = podcasts[index]
        
        return podcast
    }
    
    func numberOfItemsInSection() -> Int {
        return self.podcasts.count
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
}