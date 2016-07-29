//
//  RWPodcastPlayerViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 12/22/15.
//  Copyright © 2015 RondaleWilliams. All rights reserved.
//

import UIKit
import AVFoundation

class RWPodcastPlayerViewController: UIViewController {

    var podcast: RWPodcast?
    var isPlaying: Bool = false
    var isPaused: Bool = false
    private var seconds = 0.0

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var podcastDescription: UITextView!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var timeDurationLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!

    @IBOutlet weak var innerButtonViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var innerButtonViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!

    var player: AVAudioPlayer?
    var trackTime: NSTimeInterval?

    private var kRateDidChangeKVO = 0


    convenience init(podcast: RWPodcast) {
        self.init(nibName: "RWPodcastPlayerViewController", bundle: nil)
        self.podcast = podcast
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBarHidden = false
        let leftBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: self, action: #selector(RWPodcastPlayerViewController.dismiss))
        navigationItem.backBarButtonItem = leftBarButtonItem
        navigationController?.navigationBar.translucent = false
        navigationItem.title = "Dogma Debate"
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes =  [NSForegroundColorAttributeName : UIColor.whiteColor()]
        slider.minimumValue = 0.0
        slider.value = 0.0

        if UIDevice.isIphone4() {
            innerButtonViewLeadingConstraint.constant = 20
            innerButtonViewTrailingConstraint.constant = 20
            imageViewHeight.constant = 200.0
        } else if UIDevice.isIphone6() {
             imageViewHeight.constant = 250.0
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setUpPodcastDetails()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            if #available(iOS 9.0, *) {
                try AVAudioSession.sharedInstance().setMode(AVAudioSessionModeSpokenAudio)
            } else {
                // Fallback on earlier versions
            }
        } catch {
            print("\(error)")
        }
        
    }


    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }

    func dismiss() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func slideToTime(slider: UISlider) {
        guard let player = player else { return }
        player.pause()
        let seconds = Int64(slider.value)
        let seekTimeTo = CMTimeMake(seconds, 1)
        
        if slider.tracking {
            return
        }
        
//        if let trackTime = trackTime {
//            if CMTimeCompare(seekTimeTo, trackTime) == -1 || Float(CMTimeGetSeconds(player.currentTime())) == slider.maximumValue {
//                player.seekToTime(CMTimeSubtract(trackTime, seekTimeTo), toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
//                 slider.setValue(Float(CMTimeGetSeconds(trackTime)), animated: true)
//                player.play()
//            } else {
//                player.seekToTime(CMTimeAdd(trackTime, seekTimeTo), toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)
//                slider.setValue(Float(CMTimeGetSeconds(trackTime)), animated: true)
//                player.play()
//            }
//        }
    }

    @IBAction func rewind(sender: AnyObject) {
        let fifteenSecondsBack = CMTimeMake(15, 1)
        guard let player = player, trackTime = trackTime else { return }
        //player.seekToTime(CMTimeSubtract(trackTime, fifteenSecondsBack))
        player.currentTime = NSTimeInterval(trackTime + 15)
    }

    @IBAction func stop(sender: AnyObject) {
        isPaused = true
        player?.pause()
    }

    @IBAction func play(sender: AnyObject) {
        if isPlaying == false {
            player?.play()
            trackTime = player?.currentTime
        } else if isPaused == true {
            player?.play()
        } else {
            player?.pause()
        }
    }

//    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
//        guard let player = player, keyPath = keyPath else { return }
//        
//            if (object === player) && (keyPath == "status") {
//
//                if player.status == AVPlayerStatus.ReadyToPlay {
//                    isPlaying = true
//                    player.play()
//
//                    if let duration = player.currentItem?.asset.duration {
//                        let secs = CMTimeGetSeconds(duration)
//                        slider.maximumValue = Float(secs)
//                    }
//
//                    player.addPeriodicTimeObserverForInterval(CMTimeMake(1, 1), queue: nil) { (time) -> Void in
//                        self.trackTime = time
//                        self.seconds = CMTimeGetSeconds(time)
//                        self.timerLabel.text = self.setUpPodcastTimer(self.seconds)
//                        let sliderTime = Float(CMTimeGetSeconds(player.currentTime()))//Float(self.seconds)
//                        self.slider.setValue(sliderTime, animated: true)
//                        print("\(self.slider.value)")
//                    }
//                }
//            }
//        
//        if player.status == AVPlayerStatus.Failed {
//        }
//
//    }

    @IBAction func fastForward(sender: AnyObject) {
        let fifteenSecondsForward =  CMTimeMake(15, 1)
        guard let player = player, trackTime = trackTime else { return }
        player.currentTime = Double(trackTime + 15)
    }

    func setUpPodcastDetails() {
        guard let podcast = self.podcast else { return }
        var url: NSURL?
        
        if podcast.isFullLengthPodcast == true {
            url = RWPodcastManager.sharedManager.podcastContentForEpisode(podcast)
        } else {
            url = RWPodcastManager.sharedManager.podcastContentForEpisode(podcast)
        }

        if podcast.isFullLengthPodcast {
            timeDurationLabel.text = podcast.length

        } else {
            do {
                if let url = url  {
                    player = try AVAudioPlayer(contentsOfURL: url)
                }
            } catch {
               print("\(error)")
            }

            if let duration = player?.duration {
                 timeDurationLabel.text = setUpPodcastDuration(duration)
            }
            titleLabel.text = podcast.title
            podcastDescription.text = podcast.podcastDescription
        }

        if UIDevice.isIphone4() {
            imageViewHeight.constant = 150
            podcastDescription.font = UIFont.systemFontOfSize(12)
        }
    }

    func setUpPodcastDuration(seconds: Double) -> String {
        let (hrs, min) = modf(seconds / 3600)
        let (mins, _) = modf(min * 60)
        let string = NSString(format: "%.02d:%.02d:%.02d", Int(hrs), Int(mins), Int(00))

        return string as String
    }

    func setUpPodcastTimer(seconds: Double) -> String {
        var mins = 0.0
        var hours = 0.0
        var countedSeconds = 0.0
        var secs = 0.0
        
        while countedSeconds <= seconds {
            secs += 1
            
            if countedSeconds % 60.0 == 0 && countedSeconds > 0 {
                mins += 1
                secs = 0.0
            }
            
            if countedSeconds % 3600 == 0 && countedSeconds > 0 {
                hours += 1
                mins = 0.0
            }
            countedSeconds += 1
        }
        
        return NSString(format: "%.02d:%.02d:%.02d", Int(hours), Int(mins), Int(secs)) as String
    }

}
