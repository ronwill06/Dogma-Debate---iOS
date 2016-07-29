//
//  PodcastDownloadOperation.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/27/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class PodcastDownloadOperation: NSOperation {
    
    var podcasts: [RWPodcast] = []
    override var asynchronous: Bool {
        return true
    }
    
    override func start() {
        super.start()
        
        for podcast in podcasts {
            guard let url = podcast.url, audioURL = NSURL(string: url) else { return }
            
            NSURLSession.sharedSession().downloadTaskWithURL(audioURL, completionHandler: { (url, response, error) in
                guard let url = url else { return }
                let number = podcast.episodeNumber
                let podcastFile = "/Dogma-Debate-Episode-\(number)"

                let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                let documentsDirectory = paths.first
                
                guard let filePath = documentsDirectory?.stringByAppendingString(podcastFile) else { return }
                let data = NSData(contentsOfURL: url)
                do {
                try data?.writeToFile(filePath, options: .DataWritingAtomic)
                data?.writeToFile(filePath, atomically: true)
                } catch {}
            }).resume()
        }
    }
    
    func registerNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PodcastDownloadOperation.downloadPodcasts(_:)), name: DDPodcastOperation.PodcastOperationDidSucceed, object: nil)
    }
    
    func downloadPodcasts(notification: NSNotification) {
        var newPodcasts:[RWPodcast] = [RWPodcast]()
        if let userInfo = notification.userInfo as? [String : [AnyObject]] {
            if let podcasts = userInfo["podcastInfo"] as? [RWPodcast] {
                for podcast in podcasts {
                    newPodcasts.append(podcast)
                }
                self.podcasts = newPodcasts
            }
        }
    }
}