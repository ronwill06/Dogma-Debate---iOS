//
//  DDPodcastOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 11/16/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import Foundation

class DDPodcastOperation:NSObject, NSXMLParserDelegate {
    
    var podCasts:[RWPodcast] = [RWPodcast]()
    let podcastFeedUrl = NSURL(string: "https://api.spreaker.com/show/261996/episodes")
    var xmlParser: NSXMLParser?
    var isInsideItem: Bool =  false
    var currentElement: String = ""
    
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
                    let podCast = RWPodcast()
                    var jsonDictionary = [:]
                    
                    if let data = data {
                        do {
                            
                        jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.init(rawValue: 0)) as! [String : AnyObject]
                        print("\(jsonDictionary)")
                        podCast.title = jsonDictionary["title"] as? String
                        } catch {
                            jsonDictionary = [:]
                        }

                        
                        self.xmlParser = NSXMLParser(data:data)
                        self.xmlParser?.delegate = self
                        self.xmlParser?.parse()
                    }
                }
            }).resume()
        }
    }
    
//    func parser(parser: NSXMLParser, didStartElement elementName: String,
//        namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
//        
//            print("Start Element:\(elementName)")
//            if elementName == "item" {
//              isInsideItem = true
//            }
//            
//            if isInsideItem {
//                switch elementName {
//                case "title":
//                    currentElement = "title"
//                case "enclosure":
//                    currentElement = "enclosure"
//                case "description":
//                    currentElement = "description"
//                default:
//                    break
//                }
//                
//            }
//            
//    }
//    
//    func parser(parser: NSXMLParser, foundCharacters string: String) {
//        let podCast = RWPodcast()
//        if isInsideItem {
//            switch currentElement {
//                case "title":
//                podCast.title = string
//                print(podCast.title)
//                case "enclosure":
//                podCast.url = string
//                print("URL: \(podCast.url)")
//                case "description":
//                podCast.podcastDescription = string
//                print(podCast.podcastDescription)
//            default:
//                break
//                
//            }
//            
//            podCasts.append(podCast)
//        }
//    }
//    
//    func parser(parser: NSXMLParser, didEndElement elementName: String,
//        namespaceURI: String?, qualifiedName qName: String?) {
//            
//            if isInsideItem {
//                switch elementName {
//                    case "title":
//                    currentElement = ""
//                    case "enclosure":
//                    currentElement = ""
//                    case "description":
//                    currentElement = ""
//                default:
//                    break
//                }
//            }
//            
//        if elementName == "item" {
//            isInsideItem = false
//        }
//            
//    }
//    
    

}
