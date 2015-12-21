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
        }
    }
    
    var podcastDescription: String?
    var date: String?
    var episodeNumber: Int?
    var title: String?
    
}