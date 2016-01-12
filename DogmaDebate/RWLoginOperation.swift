//
//  RWLoginOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/10/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWLoginOperation {
    
    
    init() {
       
    }
    
    
    convenience init(username: String, password: String) {
        
        let authString = NSString(format:"%@:%@", username, password)
        let data = authString.dataUsingEncoding(NSUTF8StringEncoding)
        let encoding = data?.base64EncodedDataWithOptions(NSDataBase64EncodingOptions(rawValue: 0))
        
        if let encoding = encoding {
            let authHeader = NSString(format:"Basic %@", encoding)
            
            let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
            configuration.HTTPAdditionalHeaders =  [
                "Content-Type" : "application/rss+xml",
                "Authorization" : authHeader
            ]
        }
        
        let url = NSURL(string:"login.dogmadebate.com/feed/?oauth=token")
        
        if let url =  url {
            _ = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) -> Void in
                
            if (error != nil) {
                    return;
                } else {
                    
                    let httpResponse = response as? NSHTTPURLResponse
                    if httpResponse?.statusCode == 200 {
                        
                    }
                    
                }
                
            }).resume()
        }

        self.init()
    }

}
