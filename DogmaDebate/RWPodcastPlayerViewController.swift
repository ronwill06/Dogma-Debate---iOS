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
        slider.continuous = true
        slider.value = 0.0

        if UIDevice.isIphone4() {
            innerButtonViewLeadingConstraint.constant = 20
            innerButtonViewTrailingConstraint.constant = 20
            imageViewHeight.constant = 200.0
        } else if UIDevice.isIphone6() {
             imageViewHeight.constant = 250.0
        }
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(RWPodcastPlayerViewController.updateSlider), userInfo: nil, repeats: true)
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

    func dismiss() {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func slideToTime(slider: UISlider) {
        guard let player = player else { return }
        player.stop()
        
        let time = NSTimeInterval(slider.value)
        player.currentTime = time
        player.prepareToPlay()
        player.play()
        
    }
    
    func updateSlider() {
        guard let player = player else { return }
        slider.value = Float(player.currentTime)
        timerLabel.text = setUpPodcastTimer(Double(slider.value))
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
                 slider.maximumValue = Float(duration)
                 timeDurationLabel.text = setUpPodcastDuration(duration)
            }
            titleLabel.text = podcast.title
            podcastDescription.text = podcast.podcastDescription
            if let player = player {
                timerLabel.text = String(player.currentTime)
            }
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
