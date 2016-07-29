//
//  HomeTabBarViewController.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/20/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit
class HomeTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        let viewControllers = self.viewControllers
        let podcastsViewController = viewControllers![0] as! RWPodcastsViewController
        let podcastViewModel = RWPodcastsViewModel()
        podcastsViewController.podcastsViewModel = podcastViewModel

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.navigationBarHidden = true
        //let podcastsViewController = RWPodcastsViewController.podcastsViewController()
        //podcastsViewController.podcastsViewModel = podcastViewModel

    }
}
