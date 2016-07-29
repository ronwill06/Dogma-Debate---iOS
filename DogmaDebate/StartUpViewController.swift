//
//  StartUpViewController.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 7/1/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class StartUpViewController : UIViewController {
    
    static func startUpViewController() -> StartUpViewController {
        let startUpViewController = UIStoryboard(name: "StartUpViewController", bundle: nil).instantiateInitialViewController() as! StartUpViewController
        return startUpViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
        createTabBarController()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        runOperations()
    }
    
    func runOperations() {
        let queue = NSOperationQueue.mainQueue()
        let podcastOperation = DDPodcastOperation(page: 1)
        queue.addOperation(podcastOperation)
    }
    
    func createTabBarController() {

        if let appDelegate = UIApplication.sharedApplication().delegate, window = appDelegate.window, rootViewController = window?.rootViewController, homeScreenViewController = UIStoryboard(name: "HomeTabBarViewController", bundle: nil).instantiateInitialViewController() as? HomeTabBarViewController {
            UIView.transitionFromView(rootViewController.view, toView: homeScreenViewController.view, duration: 0.5, options: .CurveEaseInOut, completion: { (complete: Bool) -> Void in
                let navigationController = UINavigationController(rootViewController: homeScreenViewController)
                navigationController.navigationBarHidden = true
                window?.rootViewController = navigationController
            })
        }
    }
    
}
