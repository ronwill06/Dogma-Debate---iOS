//
//  RWOAuthManager.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/10/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import OAuthSwift
import HTMLReader

@objc class RWOAuthManager: NSObject {
    
    static let FourthPodcastOperationDidUpdate = "FourthPodcastsDidUpdate"
    private let clientId = "xqBztkf8SReYxRd0dz0wlOVb4wO8Lm"
    private let clientSecret = "4jNGTh18pT0ESyv5zJEzf0nabsH0At"
    static let pSandBoxClientID = "AdQrv-Ufzd163wUqICapxNhrVtAQVXf5C2xwg4qnC2KTumkln5aX4SJWvFtJ4dGSCj94F5QWhIy7jkkd"
    static let pSandBoxClientSecret = "EP7lBi-M1h-_2EtkprnnlXDGiaFpwyUBIUYJq92cL36JH4C0hmBYNm5EWtbY1rHbghNwj3XXvyPoJRYh"
    static let pLiveClientID = "AZx8Jcqhf_DM1hDCZKNU_fyjeaOOAwCyQvr3rfUkPjBVY0DQYsjTZBY-lz8FzJWyiwYAskoSKLS8geMC"
    static let pLiveClientSecret = "EKZteZTtKyCc6uNJTuRAeR4ogfKpe4vr3pbbZEZavQyAPKDTiSkZvzTxVsIxtiephy_82e34aqFpIZaQ"
    
    var isUserLoggedIn: Bool = false
    static let sharedManager = RWOAuthManager()
    
    
    override init() {
       
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
            
        oauthSwift.client.post("http://login.dogmadebate.com/?oauth=token&grant_type=password", parameters: ["client_id" : clientId ,"client_secret" : clientSecret,"grant_type" : "password", "username" : username, "password" : password], headers: ["Authorization" : "basic"], success: {[weak self] (data, response) -> Void in
            guard let strongSelf = self else { return }
            
            do {
                
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
                let accessToken =  json["access_token"] as! String
                
                oauthSwift.client.get("http://login.dogmadebate.com/wp-json/wp/v2/posts", parameters: ["access_token" : "\(accessToken)"], headers: ["scope" : "basic", "token_type" : "Bearer"], success: { (data, response) -> Void in
                    
                    do {
                        if let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0)) as? [AnyObject] {
                            print("JSON: \(json)")
                            var podcasts:[RWPodcast] = [RWPodcast]()
                            for mediaDictionary in json {
                                if let dictionary =  mediaDictionary as? [String : AnyObject] {
                                    let podcast: RWPodcast = strongSelf.parseMediaData(dictionary)
                                    podcasts.append(podcast)
                                }
                            }
                            
                            NSNotificationCenter.defaultCenter().postNotificationName(RWOAuthManager.FourthPodcastOperationDidUpdate, object: nil, userInfo: ["fourthPodcasts" : podcasts])
                            
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
    
    
    
    private func parseMediaData(dictionary: [String : AnyObject]) -> RWPodcast {
        let podcast = RWPodcast()
        
        if let titleContent = dictionary["title"] as? [String : String], title = titleContent["rendered"] {
            let firstTitle = title.stringByReplacingOccurrencesOfString("&#8211;", withString: "")
            let secondTitle = firstTitle.stringByReplacingOccurrencesOfString("&#038;", withString: "")
            let thirdTitle =  secondTitle.stringByReplacingOccurrencesOfString("&#8217;", withString: "'")
            let ampersandTitle = thirdTitle.stringByReplacingOccurrencesOfString("&amp;", withString: " & ")
            let newTitle = ampersandTitle
            podcast.title = newTitle
        }
        
        if let mediaContent = dictionary["content"] as? [String : String], rendered = mediaContent["rendered"] {
            let document =  HTMLDocument(string: rendered)
            print("Document: \(document)")
            let documentElements = document.nodesMatchingSelector("p")
            print("\(documentElements)")
            if documentElements.count >= 2 {
                let mp3Element = documentElements[1]
                let mp3 = mp3Element.firstNodeMatchingSelector("a")?.attributes["href"]
                podcast.url = mp3
                
            } else {
                let videoElement = documentElements[0]
                podcast.videoUrl = videoElement.firstNodeMatchingSelector("iframe")?.attributes["src"]
                print("Video Element: \(videoElement.firstNodeMatchingSelector("iframe")?.attributes["src"])")
            }
                podcast.podcastDescription = rendered
            
        }
        
        return podcast
        
    }
    

}
