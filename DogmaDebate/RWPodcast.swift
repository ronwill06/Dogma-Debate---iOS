//
//  RWPodcast.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/19/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWPodcast: NSObject {
    
    var podcastTitle: String?
    var podcastDate: String?
    var podcastDescription: String?
    var episodeNumber = 0
    
    override init() {
        super.init()
    }
    
    convenience init(title: String, date: String, description: String, number: Int) {
        self.init()
        self.podcastTitle = title
        self.podcastDate = date
        self.podcastDescription = description
        self.episodeNumber = number
    }

}
