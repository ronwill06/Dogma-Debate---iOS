//
//  RWSignUpWebViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/25/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWSignUpWebViewController: UIViewController{
    
    static func signUpWebViewController() -> RWSignUpWebViewController {
        let vc = UIStoryboard(name: "RWSignUpWebViewController", bundle: nil).instantiateInitialViewController() as! RWSignUpWebViewController
        vc.title = "4th"
        return vc
    }
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barStyle = .Black
        
        activityIndicator.startAnimating()
        
        let url = NSURL(string: "http://login.dogmadebate.com/")
        
        if let url = url {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
        
        if webView.loading {
            activityIndicator.alpha = 1.0
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }

    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}

extension RWSignUpWebViewController: UIWebViewDelegate {
    
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
}
