//
//  DDPodcastOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/16/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class DDPodcastOperation:NSObject, NSXMLParserDelegate {
    
    let podcastFeedUrl = NSURL(string: "http://login.dogmadebate.com/podcast/feed/" )
    var xmlParser: NSXMLParser?
    
    override init() {
        super.init()
        fetchData()
    }
    
    func fetchData() {
        
        let urlSession = NSURLSession.sharedSession()
        if let url = podcastFeedUrl {
            
            urlSession.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                if error != nil {
                    print("Error with podcast operation")
                } else {
                    
                    if let data = data {
                        self.xmlParser = NSXMLParser(data:data)
                        self.xmlParser?.delegate = self
                        self.xmlParser?.parse()
                    }
                }
            }).resume()
        }
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String,
        namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        
            print(elementName)
            if elementName == "item" {
                
            }
    }
    
    

}
