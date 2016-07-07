//
//  FourthListenerOperation.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/2/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

struct FourthOperationKeys {
    static let ExtraContentEndpoint = "https://api.backendless.com/v1/data/ExtraShows"
    static let FourthListenerContentFinishedNotification = "FourthListenerContentFinishedNotification"
    static let FourthListenerContentFailedNotification = "FourthListenerContentFailedNotification"
}

class FourthListenerOperation: NSOperation {

    let session: NSURLSession
    var podcasts: [RWPodcast] = []

   override var asynchronous: Bool {
        return true
    }


    override init() {
        let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let headers = ["application-id": "26025EF9-3841-460D-FF2A-0AF4DE17FE00",
                       "secret-key" : "2BE4DD47-790B-1FAE-FF3C-41DADE420D00",
                       "application-type" : "REST"]
        sessionConfiguration.HTTPAdditionalHeaders = headers

        self.session = NSURLSession(configuration: sessionConfiguration)
    }

    override func start() {
        let url = NSURL(string: FourthOperationKeys.ExtraContentEndpoint)
        self.session.dataTaskWithURL(url!) { [weak self] (data, response, error) in
            do {
                guard let data = data, strongSelf = self else { return }
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
                if let jsonResponse = json["data"] as? [[String : AnyObject]] {
                    for object in jsonResponse {
                        let podcast = RWPodcast()
                        let episodeNumber = object["episodenumber"] as! Int
                        podcast.episodeNumber = String(episodeNumber)
                        podcast.title = object["title"] as! String
                        podcast.podcastDescription = object["description"] as? String
                        podcast.url = object["url"] as? String
                        let secs =  object["seconds"] as! Int
                        podcast.length = podcast.timeForPodcasts(secs)
                        podcast.isFullLengthPodcast = true

                        var podcastfile = ""
                        podcastfile = "/Dogma-Debate-EpisodeExtra-\(podcast.episodeNumber)"


                        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
                        let documentsDirectory = paths.first

                        guard let filePath = documentsDirectory?.stringByAppendingString(podcastfile) else { return }
                        try podcast.url?.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)

                        strongSelf.podcasts.append(podcast)
                    }


                    dispatch_async(dispatch_get_main_queue(), {
                          NSNotificationCenter.defaultCenter().postNotificationName(FourthOperationKeys.FourthListenerContentFinishedNotification, object: nil, userInfo: ["content" : strongSelf.podcasts])
                    })

                }

            } catch {
                NSNotificationCenter.defaultCenter().postNotificationName(FourthOperationKeys.FourthListenerContentFailedNotification, object: nil, userInfo: ["content" : ""])
            }
        }.resume()
    }
}
