//
//  RWPodcastCellViewModel.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/10/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation


class RWPodcastCellViewModel: NSObject {
    
    var podcast: RWPodcast? {
        didSet {
            self.podcastDescription = podcast?.podcastDescription
            self.date = podcast?.podcastDate
            self.episodeNumber = podcast?.episodeNumber
            self.title = podcast?.title
            self.secs = RWPodcastManager.secondsForPodcast(podcast!)
        }
    }
    
    var podcastDescription: String?
    var date: String?
    var episodeNumber: String?
    var title: String?
    var secs: String?
    
}