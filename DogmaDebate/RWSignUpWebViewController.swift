//
//  RWSignUpWebViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/25/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import WebKit

class RWSignUpWebViewController: UIViewController {
    
    static func signUpWebViewController() -> RWSignUpWebViewController {
        let vc = UIStoryboard(name: "RWSignUpWebViewController", bundle: nil).instantiateInitialViewController() as! RWSignUpWebViewController
        vc.title = "4th"
        return vc
    }
    
    
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barStyle = .Black
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        let webview = WKWebView(frame: view.frame, configuration: configuration)
        let url = NSURL(string: "http://login.dogmadebate.com/")
        
        if let url = url {
            let request = NSURLRequest(URL: url)
            webview.loadRequest(request)
        }
        
        view.addSubview(webview)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "4th"
        //        let url = NSURL(string: "http://login.dogmadebate.com/")
        //        if let url = url {
        //            let request = NSURLRequest(URL: url)
        //            webview.loadRequest(request)
        //        }
        //
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    
}
