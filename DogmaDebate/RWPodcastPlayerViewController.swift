//
//  RWPodcastPlayerViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import UIKit
import AVFoundation

class RWPodcastPlayerViewController : UIViewController {
    
    var podcast: RWPodcast?
    var isPlaying:Bool = false
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var podcastDescription: UITextView!
    @IBOutlet weak var slider: UISlider!
    
    var player: AVPlayer!
    var trackTime:CMTime?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpPodcastDetails()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @IBAction func rewind(sender: AnyObject) {
        player.currentItem?.canPlayReverse
    }
    
    @IBAction func stop(sender: AnyObject) {
//        isPlaying = false
        player.rate = 0.0
        //player.pause()
    }
    
    @IBAction func play(sender: AnyObject) {
        
        if isPlaying == false {
            if let podcastUrl = podcast?.url {
                let url = NSURL(string: podcastUrl)
                if let audioUrl = url {
                    
                    let audioPlayer = AVPlayer(URL:audioUrl)
                    player = audioPlayer
                    player.addObserver(self, forKeyPath: "status", options: NSKeyValueObservingOptions(rawValue: 0), context: nil)
                }
                
            }
        } else {
            player.pause()
        }
        
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if let keyPath = keyPath {
            if (object === self.player) && (keyPath == "status")  {
                
                if player.status == AVPlayerStatus.ReadyToPlay {
                    isPlaying = true
                    player.play()
                    let time = player.currentItem?.duration.seconds
                    let number = NSNumber(double: time!)
                    slider.setValue(number.floatValue, animated: true)
                
                }
                
                
                if self.player.status == AVPlayerStatus.Failed {
                    
                }
                
            }
            
        }
        
    }
    
    @IBAction func fastForward(sender: AnyObject) {
        let fiveSecondsIn = CMTimeMake(30, 1)
        player.seekToTime(fiveSecondsIn)
    }
    
    func setUpPodcastDetails() {
        titleLabel.text = podcast?.title
        podcastDescription.text = podcast?.podcastDescription
    }
    
    func configureTime() {
        let duration = player.currentItem?.duration
        //player.addPeriodicTimeObserverForInterval(<#T##interval: CMTime##CMTime#>, queue: <#T##dispatch_queue_t?#>, usingBlock: <#T##(CMTime) -> Void#>)
    }
}
