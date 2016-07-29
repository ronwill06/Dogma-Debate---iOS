//
//  RWPodcast.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/19/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation
import AVFoundation

class RWPodcast {

    var title: String = ""
    var podcastDate: String?
    var podcastDescription: String?
    var length: String = ""
    var url: String?
    var videoUrl: String?
    var episodeNumber: String = ""
    var isFullLengthPodcast = false

    convenience init(title: String, date: String, description: String, number: String) {
        self.init()
        self.title = title
        self.podcastDate = date
        self.podcastDescription = description
        self.episodeNumber = number

    }

    static func fetchEpisodeForPodcast(podcast: RWPodcast) -> String {
        let directores = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = directores.first
        guard let mp3FilePath = documentDirectory?.stringByAppendingString("/Dogma-Debate-Episode-\(podcast.episodeNumber)") else { return "" }

        if NSFileManager.defaultManager().fileExistsAtPath(mp3FilePath) {
            guard let data = NSData(contentsOfFile: mp3FilePath), mp3Url = String(data:data, encoding: NSUTF8StringEncoding) else { return ""}
            return mp3Url
        }

        return ""
    }

    static func fetchFullEpisodeForPodcast(podcast: RWPodcast) -> String {
        let directores = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDirectory = directores.first
        guard let mp3FilePath = documentDirectory?.stringByAppendingString("/Dogma-Debate-EpisodeExtra-\(podcast.episodeNumber)") else { return "" }

        if NSFileManager.defaultManager().fileExistsAtPath(mp3FilePath) {
            guard let data = NSData(contentsOfFile: mp3FilePath), mp3Url = String(data:data, encoding: NSUTF8StringEncoding) else { return ""}
            return mp3Url
        }

        return ""
    }

    func timeForPodcasts(seconds: Int) -> String {
        var string: NSString
        let hrs = seconds / 3600
        let mins = (seconds % 3600) / 60
        let secs = mins % 60
        if Int(hrs) == 0 {
            string = NSString(format: "%.02d:%.02d", mins, secs)
        } else {
            string = NSString(format: "%.02d:%.02d:%.02d", hrs, mins, secs)
        }

        return string as String

    }

}
