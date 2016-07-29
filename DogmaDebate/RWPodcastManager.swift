//
//  RWPodcastManager.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 6/23/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import AVFoundation

class RWPodcastManager {
    
    static let sharedManager = RWPodcastManager()
    
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
    
    func downloadPodcastContent(url: String, forEpisodeNumber number: Int) {
        guard let audioURL = NSURL(string: url) else { return }
        
        NSURLSession.sharedSession().dataTaskWithURL(audioURL, completionHandler: { (data, response, error) in
            let podcastFile = "Dogma-Debate-Episode-\(number).mp3"
            let fileManager = NSFileManager.defaultManager()
            fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
            
            let paths = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
            let documentsDirectory = paths.first
            let filePath = documentsDirectory?.URLByAppendingPathComponent(podcastFile)
            
            if let filePathString = filePath?.absoluteString, data = data {
                let podcastData = NSData(data: data)
                if !NSFileManager.defaultManager().fileExistsAtPath(filePathString) {
                        podcastData.writeToURL(filePath!, atomically: true)
                }
            }
        }).resume()
        
    }
    
    
    func podcastContentForEpisode(podcast: RWPodcast) -> NSURL? {
        guard let episodeNumber = Int(podcast.episodeNumber) else {return nil}
        let url = podcast.url
        let fileManager = NSFileManager.defaultManager()
        let podcastFile = "Dogma-Debate-Episode-\(episodeNumber).mp3"
        let paths = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentsDirectory = paths.first
        
        let filePath = documentsDirectory?.URLByAppendingPathComponent(podcastFile)
        
        if let filePathString = filePath?.absoluteString {
            if !NSFileManager.defaultManager().fileExistsAtPath(filePathString) {
                downloadPodcastContent(url!, forEpisodeNumber: episodeNumber)
            } else {
                guard let filePath = filePath else { return nil }
                if let data = NSData(contentsOfURL: filePath) {
                    return filePath
                }
                
            }
        }
        
        return filePath
    }
}
