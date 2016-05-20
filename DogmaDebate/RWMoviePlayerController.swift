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
    
    @IBOutlet var playerView: YTPlayerView!
    var videoUrl: String = ""
    
    override func viewDidLoad() {
        
        if !videoUrl.isEmpty {
            let components =  videoUrl.componentsSeparatedByString("/")
            
        }
    }
}
