//
//  RWLoginOperation.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/10/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import OAuthSwift

class RWOAuthManager {
    
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
        contentType: "application/x-www-form-urlencoded")
        
        oauthSwift.accessTokenBasicAuthentification = true
        
        oauthSwift.client.post("http://login.dogmadebate.com/?oauth=token&grant_type=password", parameters: ["client_id" : clientId ,"client_secret" : clientSecret,"grant_type" : "password", "username" : username, "password" : password], headers: ["Authorization" : "basic"], success: { (data, response) -> Void in
            print("\(response)")
            
            if response.statusCode == 200 {
                let dataString = NSString(data: data, encoding:NSUTF8StringEncoding)
                print("\(dataString)")
            }
            
            }) { (error) -> Void in
                print("\(error.localizedDescription)")
                let alertView = UIAlertView()
                alertView.title = "Incorrect Password"
                alertView.message = "We could not log you in. Please try again."
                alertView.addButtonWithTitle("Dismiss")
                alertView.cancelButtonIndex = 0
                alertView.show()
                
            
        }
        
        
        
    }
    
    
    

}
