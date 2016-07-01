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
    var podcasts:[AnyObject] = []
    var oldPodcasts = [AnyObject]()
    var collectionViewReference: UICollectionView?
    var update: (() -> Void)?
    
    override init() {
        super.init()
        tabBarTitle = "Podcasts"
        fetchData()
    }
    
    func fetchData() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RWPodcastsViewModel.podcastData(_:)), name:DDPodcastOperation.PodcastOperationDidSucceed,
                                                         object: nil)
    }
    
    @objc func podcastData(notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String : [AnyObject]] {
            if let newPodcasts = userInfo["podcastInfo"] as? [RWPodcast] {
                for podcast in newPodcasts {
                    oldPodcasts.append(podcast)
                }
                self.podcasts = oldPodcasts
                self.update?()
                oldPodcasts = self.podcasts
                self.podcasts.append("Load More Podcasts...")
            }
        }
    }
    
    func cellViewModelAtIndex(index: Int) -> AnyObject? {
        let cellViewModel = RWPodcastCellViewModel()
        if index == podcasts.count - 1 {
            return nil
        } else {
            cellViewModel.podcast = podcasts[index] as? RWPodcast
            return cellViewModel
        }
    }
    
    func podcastAtIndex(index: Int) -> RWPodcast? {
        let podcast = podcasts[index]
        return podcast as? RWPodcast
        
    }
    
    func numberOfItemsInSection() -> Int {
        return podcasts.count
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
}