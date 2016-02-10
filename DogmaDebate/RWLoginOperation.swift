//
//  RWLoginOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/10/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import OAuthSwift

class RWLoginOperation {
    
//http://login.dogmadebate.com/&response_type&client_secret=\(clientSecret)&grant_type=password&username=\(username)&password=\(password)
    let clientId = "xqBztkf8SReYxRd0dz0wlOVb4wO8Lm"
    let clientSecret = "4jNGTh18pT0ESyv5zJEzf0nabsH0At"
    
    
    init() {
       
    }
    
    
    convenience init(username: String, password: String) {
        self.init()
        
       let oauthSwift =  OAuth2Swift(
        consumerKey: clientId,
        consumerSecret: clientSecret,
        authorizeUrl:"http://login.dogmadebate.com/oauth/authorize" ,
        accessTokenUrl:  "http://login.dogmadebate.com/oauth/token",
        responseType: "token",
        contentType: "application/json")
        
        oauthSwift.accessTokenBasicAuthentification = true
        
        oauthSwift.client.post("http://login.dogmadebate.com/feed/?oauth=token", parameters: ["grant_type" : password], headers: ["Authorization" : "basic" ], success: { (data, response) -> Void in
            print("\(response)")
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? [String : AnyObject]
             print("\(json)")
                
            } catch {
                
            }
            
            }) { (error) -> Void in
                print("\(error.localizedDescription)")
        }

    }
    
    
    

}
