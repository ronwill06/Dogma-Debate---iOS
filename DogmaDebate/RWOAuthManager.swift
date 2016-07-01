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

    private let clientId = "xqBztkf8SReYxRd0dz0wlOVb4wO8Lm"
    private let clientSecret = "4jNGTh18pT0ESyv5zJEzf0nabsH0At"

    var isUserLoggedIn: Bool = false
    static let sharedManager = RWOAuthManager()


    init() {

    }

    func authorizeUser(username: String, password: String) {

        let oauthSwift =  OAuth2Swift(
            consumerKey: clientId,
            consumerSecret: clientSecret,
            authorizeUrl:"http://login.dogmadebate.com/oauth/authorize" ,
            accessTokenUrl:  "http://login.dogmadebate.com/oauth/token",
            responseType: "token",
            contentType: "application/x-www-form-urlencoded")

        oauthSwift.accessTokenBasicAuthentification = true

        oauthSwift.client.post("http://login.dogmadebate.com/?oauth=token&grant_type=password", parameters: ["client_id" : clientId, "client_secret" : clientSecret, "grant_type" : "password", "username" : username, "password" : password], headers: ["Authorization" : "basic"], success: {[weak self] (data, response) -> Void in
            guard let strongSelf = self else { return }

            do {

                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
                let accessToken =  json["access_token"] as! String

                oauthSwift.client.get("http://login.dogmadebate.com/wp-json/wp/v2/posts", parameters: ["access_token" : "\(accessToken)"], headers: ["scope" : "basic", "token_type" : "Bearer"], success: { (data, response) -> Void in

                    do {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? [AnyObject] {

                            for mediaDictionary in json {
                                if let dictionary =  mediaDictionary as? [String : AnyObject] {
                                    strongSelf.parseMediaData(dictionary)
                                }
                            }
                        }

                    } catch {

                    }

                    }, failure: { (error) -> Void in
                        print("\(error.localizedDescription)")
                })


            } catch {

            }


            strongSelf.isUserLoggedIn = true

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

    private func parseMediaData(dictionary: [String : AnyObject]) {
        if let titleContent = dictionary["title"] as? [String : String], title = titleContent["rendered"] {
            print("Title: \(title)")
        }
        let mediaContent = dictionary["content"] as? [String : String]
        print("\(mediaContent)")

    }
}
