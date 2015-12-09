//
//  DDPodcastOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/16/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class DDPodcastOperation: NSObject {
    static let PodcastOperationDidSucceed = "PodcastOperationDidSucceed"
    static let PodcastOperationDidFail = "PodcastOperationDidFail"
    
    var podCasts:[RWPodcast] = [RWPodcast]()
    let podcastFeedUrl = NSURL(string: "https://api.spreaker.com/show/261996/episodes")
    
    override init() {
        super.init()
        fetchData()
    }
    
    func fetchData() {
        
        let urlSession = NSURLSession.sharedSession()
        if let url = podcastFeedUrl {
        
            urlSession.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
               // guard let strongSelf = self else { return }
                if error != nil {
                    print("Error with podcast operation")
                    NSNotificationCenter.defaultCenter().postNotificationName(DDPodcastOperation.PodcastOperationDidFail, object: error)
                    
                } else {
                    let podCast = RWPodcast()
                    var jsonDictionary = [:]
                    
                    if let data = data {
                        do {
                            jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(rawValue: 0)) as! [String : AnyObject]
                            if let jsonResponse = jsonDictionary["response"] as? [String : AnyObject], pager = jsonResponse["pager"] as? [String : AnyObject],
                            results = pager["results"] as? [[String : AnyObject]] {
                                print("\(results)")
                                for episode in results {
                                    podCast.title = episode["title"] as? String ?? ""
                                    podCast.podcastDescription = episode["description"] as? String ?? ""
                                    podCast.podcastDate = episode["published_at"] as? String ?? ""
                                    podCast.url = episode["download_url"] as? String ?? ""
                                    
                                    self.podCasts.append(podCast)
                                }
                                
                                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                  NSNotificationCenter.defaultCenter().postNotificationName(DDPodcastOperation.PodcastOperationDidSucceed, object: nil,
                                  userInfo: ["podCastInfo" : self.podCasts])
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
