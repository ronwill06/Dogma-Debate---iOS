//
//  RWPodcast.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/19/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWPodcast: NSObject {
    
    var title: String = ""
    var podcastDate: String?
    var podcastDescription: String?
    var url: String?
    var episodeNumber: String?
    
    override init() {
        super.init()
    }
    
    convenience init(title: String, date: String, description: String, number: String) {
        self.init()
        self.title = title
        self.podcastDate = date
        self.podcastDescription = description
        self.episodeNumber = number
    }

}
