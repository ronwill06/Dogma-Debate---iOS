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
    
    let clientId = "xqBztkf8SReYxRd0dz0wlOVb4wO8Lm"
    let clientSecret = "4jNGTh18pT0ESyv5zJEzf0nabsH0At"
    
    
    init() {
       
    }
    
    
    convenience init(username: String, password: String) {
        self.init()
        
        let oauthSwift = OAuth2Swift(
            consumerKey: clientId,
            consumerSecret: clientSecret,
            authorizeUrl: "http://login.dogmadebate.com/feed/oauth/authorize",
            accessTokenUrl: "http://login.dogmadebate.com/feed/oauth/access_token",
            responseType: "code")
        
        if let url = NSURL(string: "login.dogmadebate.com/oauth/authorize?response_type=code&amp;client_id=\(clientId)") {
            
            oauthSwift.authorizeWithCallbackURL(url, scope:"login.dogmadebate.com/feed/", state: "", success: { (credential, response, parameters) -> Void in
               print("Response:\(response)")
                
                }) { (error) -> Void in
                 print("Error:\(error.localizedDescription)")
            }
        }
        
        
        
    }
    
    
    

}
