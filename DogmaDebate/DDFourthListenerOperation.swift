//
//  DDFourthListenerOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 2/10/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

enum ElementType: String {
    case Item = "item"
    case Title = "title"
    case Enclosure = "enclosure"
}

class DDFourthListenerOperation: NSObject, NSXMLParserDelegate {
    
    var xmlParser: NSXMLParser?
    var specialContent: [AnyObject] = [AnyObject]()
    var inItem: Bool = false
    
    private var parsedElement = String()
    
    override init() {
        super.init()
        
        let urlString = "http://login.dogmadebate.com/feed/?wpmfeedkey=1063%3B74dba545d58ffef394e0b751663f0cdf"
        if let url = NSURL(string: urlString) {
            
            let session = NSURLSession.sharedSession()
            session.dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                //guard let strongSelf = self else { return }
                
                if let data = data {
                    self.xmlParser = NSXMLParser(data: data)
                    self.xmlParser?.delegate = self
                    self.xmlParser?.parse()
                }
            }).resume()
        }
        
   }
    
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        print("Element Name:\(elementName)")
        print("Attribute Dict:\(attributeDict)")
        
        let podcast = RWPodcast()
        
        if elementName == "item" {
            inItem = true
        }
        
        switch elementName {
            
        case ElementType.Title.rawValue:
            parsedElement = "title"
        case:
        default:
            break
        }
    }
    
    
    func parser(parser: NSXMLParser, foundCharacters string: String) {
        print("Found Characters:\(string)")
    }
    
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print("Element Name At End:\(elementName)")
        print("Qualified Name At End:\(qName)")
    }
    
}