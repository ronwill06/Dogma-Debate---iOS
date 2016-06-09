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
    var podcasts:[RWPodcast]?
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
            if let podcasts = userInfo["podcastInfo"] as? [RWPodcast] {
                self.podcasts = podcasts
                self.update?()
                if let collectionView = self.collectionViewReference {
                    collectionView.reloadData()
                }
            }
        }
    }
    
    func cellViewModelAtIndex(index: Int) -> RWPodcastCellViewModel {
        let cellViewModel = RWPodcastCellViewModel()
        if let podcasts = podcasts {
            cellViewModel.podcast = podcasts[index]
        }
        
        return cellViewModel
    }
    
    func podcastAtIndex(index: Int) -> RWPodcast? {
        if let podcasts = podcasts {
            let podcast = podcasts[index]
            return podcast
        }
        
        return nil
    }
    
    func numberOfItemsInSection() -> Int {
        if let podcasts = podcasts {
            return podcasts.count
        }
        return 0
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
}