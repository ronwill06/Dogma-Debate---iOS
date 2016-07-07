//
//  RWPodcastManager.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 6/23/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import AVFoundation

class RWPodcastManager {
    
    static func setUpPodcastDuration(seconds: Double) -> String {
        var string: NSString
        let (hrs, min) = modf(seconds / 3600)
        let (mins, _) = modf(min * 60)
        if Int(hrs) == 0 {
            string = NSString(format: "%.02d:%.02d", Int(mins), Int(00))
        } else {
            string = NSString(format: "%.02d:%.02d:%.02d", Int(hrs), Int(mins), Int(00))
        }
        
        return string as String
    }
}
