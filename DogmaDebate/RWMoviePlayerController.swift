//
//  RWMoviePlayerController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/19/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class RWMoviePlayerController: UIViewController {
    
    @IBOutlet weak var playerView: YTPlayerView!
   
    var videoUrl: String = ""
    
    static func moviePlayerViewController() -> RWMoviePlayerController {
        let vc = UIStoryboard(name: "RWMoviePlayerController", bundle: nil).instantiateInitialViewController() as! RWMoviePlayerController
        return vc
    }
    
    override func viewDidLoad() {
                
    }
    
    override func viewDidAppear(animated: Bool) {
        if !videoUrl.isEmpty {
            let components = videoUrl.componentsSeparatedByString("/")
            let videoId = components[4]
            if let playerView = playerView {
                playerView.loadWithVideoId(videoId)
                playerView.playVideo()
            }
        }
    }
}
