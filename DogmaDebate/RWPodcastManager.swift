//
//  RWPodcastManager.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/6/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class RWPodcastManager {
    
    var podcasts: [RWPodcast]?
    
    func addPodcast(podcast: RWPodcast) {
        podcasts?.append(podcast)
    }
}