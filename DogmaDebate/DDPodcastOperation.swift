//
//  DDPodcastOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/16/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class DDPodcastOperation: NSOperation {
    static let PodcastOperationDidSucceed = "PodcastOperationDidSucceed"
    static let PodcastOperationDidFail = "PodcastOperationDidFail"
    
    var podCasts:[RWPodcast] = [RWPodcast]()
    let podcastFeedUrl = NSURL(string: "https://api.spreaker.com/show/261996/episodes")
    
    override init() {
        super.init()
    }
    
    
    override func start() {
        
        let urlSession = NSURLSession.sharedSession()
        if let url = podcastFeedUrl {
            
            urlSession.dataTaskWithURL(url, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print("Error with podcast operation")
                    NSNotificationCenter.defaultCenter().postNotificationName(DDPodcastOperation.PodcastOperationDidFail, object: error)
                    
                } else {
                    var jsonDictionary = [:]
                    
                    if let data = data {
                        do {
                            jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(rawValue: 0)) as! [String : AnyObject]
                            if let jsonResponse = jsonDictionary["response"] as? [String : AnyObject], pager = jsonResponse["pager"] as? [String : AnyObject],
                                results = pager["results"] as? [[String : AnyObject]] {
                                print("\(results)")
                                for episode in results {
                                    let podcast = RWPodcast()
                                    podcast.title = episode["title"] as? String ?? ""
                                    let string = podcast.title as? NSString
                                    podcast.episodeNumber =  string?.substringWithRange(NSMakeRange(1, 3))
                                    podcast.podcastDescription = episode["description"] as? String ?? ""
                                    let dateString = episode["published_at"] as? NSString ?? ""
                                    podcast.podcastDate = dateString.substringWithRange(NSMakeRange(0, 10))
                                    podcast.url = episode["download_url"] as? String ?? ""
                                    
                                    self.podCasts.append(podcast)
                                }
                                
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                    NSNotificationCenter.defaultCenter().postNotificationName(DDPodcastOperation.PodcastOperationDidSucceed, object: nil,
                                        userInfo: ["podcastInfo" : self.podCasts])
                                })
                            }
                        } catch {
                            jsonDictionary = [:]
                        }
                        
                    }
                }
            }).resume()
            
        }
        
    }
}
