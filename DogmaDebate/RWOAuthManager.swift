//
//  RWOAuthManager.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 6/30/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import OAuthSwift

class RWOAuthManager {
    
    private static let clientId = "xqBztkf8SReYxRd0dz0wlOVb4wO8Lm"
    private static let clientSecret = "4jNGTh18pT0ESyv5zJEzf0nabsH0At"
    
    static let sharedManager = RWOAuthManager()
    var operationQueue = NSOperationQueue()
    var loading = false
    
    func authorizeUser(username: String, password: String) {
        let authenticationOperation = UserAuthenticationOperation(username: username, password: password)
        operationQueue.addOperation(authenticationOperation)
        
        if authenticationOperation.operationBeganExecuting() {
            loading = true
        }
    }

    func fetchFourthData() {
      let fourthOp = FourthListenerOperation()
      operationQueue.addOperation(fourthOp)
    }

}
