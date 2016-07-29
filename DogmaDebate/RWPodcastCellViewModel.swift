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
            guard let podcast = podcast else { return }
            self.podcastDescription = podcast.podcastDescription
            self.date = podcast.podcastDate
            self.episodeNumber = podcast.episodeNumber
            self.title = podcast.title
            //Fetch data for URL here
        }
    }
    
    var podcastDescription: String?
    var date: String?
    var episodeNumber: String?
    var title: String?
    var secs: String?
    
}