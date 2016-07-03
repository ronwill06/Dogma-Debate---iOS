//
//  FourthListenerViewModel.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/2/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class FourthListenerViewModel {
    
    var podcasts: [RWPodcast] = []
    var update:(() -> Void)?
    
    init() {
       RWOAuthManager.sharedManager.fetchFourthData()
       registerNotifications()
    }
    
    func registerNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(FourthListenerViewModel.fetchPodcasts(_:)), name: FourthOperationKeys.FourthListenerContentFinishedNotification, object: nil)
    }
    
    @objc func fetchPodcasts(notification: NSNotification) {
        if let userInfo = notification.userInfo as? [String : AnyObject]  {
            if let podcasts = userInfo["content"] as? [RWPodcast] {
                self.podcasts = podcasts
                self.update?()
            }
        }
    }
    
    func podcastForIndex(index: Int) -> RWPodcast {
        let podcast = podcasts[index]
        return podcast
    }
    
    func titleForPodcastAtIndex(index: Int) -> String {
        let podcast = podcasts[index]
        return "\(podcast.episodeNumber) - \(podcast.title)"
        
    }
    
    func descriptionForPodcast(atIndex: Int) -> String {
        let podcast = podcasts[atIndex]
        guard let description = podcast.podcastDescription else { return ""}
        return description
    }
    
    func numberOfItemsInSection() -> Int {
        return podcasts.count
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}
