//
//  UserAuthenticationOperation.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/2/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import OAuthSwift


struct NotificationKeys {
    static let UserEnabledNotification = "UserEnabledNotification"
    static let UserFailedNotification = "UserEnabledNotification"
}


class UserAuthenticationOperation : NSOperation {
    
    private let clientId = "xqBztkf8SReYxRd0dz0wlOVb4wO8Lm"
    private let clientSecret = "4jNGTh18pT0ESyv5zJEzf0nabsH0At"
    
    let username: String
    let password: String
    
    override var asynchronous: Bool {
        return true
    }
    
    private var _executing: Bool = false
    override var executing: Bool {
        get { return _executing }
        set (executing) {
            willChangeValueForKey("isExecuting")
            _executing = executing
            didChangeValueForKey("isExecuting")
        }
    }
    
    private var _finished: Bool = false
    override var finished: Bool {
        get { return _finished }
        set (finished) {
            willChangeValueForKey("isFinished")
            _finished = finished
            didChangeValueForKey("isFinished")
        }
    }
    
    private var _cancelled: Bool = false
    override var cancelled: Bool {
        get { return _cancelled }
        set (cancelled) {
            willChangeValueForKey("isCancelled")
            _cancelled = cancelled
            didChangeValueForKey("isCancelled")
        }
    }


    init(username: String, password: String) {
        self.username = username
        self.password = password
        super.init()
    }
    
    
    override func start() {
        //operationBeganExecuting()
        
        let oauthSwift =  OAuth2Swift(
            consumerKey: clientId,
            consumerSecret: clientSecret,
            authorizeUrl:"http://login.dogmadebate.com/oauth/authorize" ,
            accessTokenUrl:  "http://login.dogmadebate.com/oauth/token",
            responseType: "token",
            contentType: "application/x-www-form-urlencoded")
        
        oauthSwift.accessTokenBasicAuthentification = true
        
        oauthSwift.client.post("http://login.dogmadebate.com/?oauth=token&grant_type=password", parameters: ["client_id" : clientId, "client_secret" : clientSecret, "grant_type" : "password", "username" : username, "password" : password], headers: ["Authorization" : "basic"], success: { (data, response) -> Void in
            NSNotificationCenter.defaultCenter().postNotificationName(NotificationKeys.UserEnabledNotification, object: nil, userInfo: ["enabled": true])
            
        }) { [weak self] (error) -> Void in
            guard let strongSelf = self else { return }
            print("\(error.localizedDescription)")
            NSNotificationCenter.defaultCenter().postNotificationName(NotificationKeys.UserFailedNotification, object: nil, userInfo: ["enabled": false])
            strongSelf.cancelled = true
        }
        
        //operationFinishedExecuting()
    }
    
    func operationBeganExecuting() -> Bool {
        finished = false
        executing = true
        
        return executing
    }
    
    func operationFinishedExecuting() -> Bool {
        executing = false
        finished = true
        
        return finished
    }
    

}