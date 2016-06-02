//
//  RWSignUpWebViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/25/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation
import WebKit

class RWSignUpWebViewController: UIViewController{
    
    static func signUpWebViewController() -> RWSignUpWebViewController {
        let vc = UIStoryboard(name: "RWSignUpWebViewController", bundle: nil).instantiateInitialViewController() as! RWSignUpWebViewController
        vc.title = "4th"
        return vc
    }
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = UIColor.blackColor()
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barStyle = .Black
        
        activityIndicator.startAnimating()
        
        let configuration = WKWebViewConfiguration()
        configuration.allowsInlineMediaPlayback = true
        let webview = WKWebView(frame: view.frame, configuration: configuration)
        webview.navigationDelegate = self
        let url = NSURL(string: "http://login.dogmadebate.com/")
        
        if let url = url {
            let request = NSURLRequest(URL: url)
            webview.loadRequest(request)
        }
        
        view.addSubview(webview)
        
        if webview.loading == true {
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

extension RWSignUpWebViewController: WKNavigationDelegate {
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.view.bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        activityIndicator.stopAnimating()
    }

}
