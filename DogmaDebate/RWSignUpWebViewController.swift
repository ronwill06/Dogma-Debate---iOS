//
//  RWSignUpWebViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/25/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWSignUpWebViewController: UIViewController {
    
    static func signUpWebViewController() -> RWSignUpWebViewController {
        let vc = UIStoryboard(name: "RWSignUpWebViewController", bundle: nil).instantiateInitialViewController() as! RWSignUpWebViewController
        vc.title = "4th"
        return vc
    }
    
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        
//        self.title = "4th"
//        let url = NSURL(string: "http://login.dogmadebate.com/")
//        if let url = url {
//            let request = NSURLRequest(URL: url)
//            webView.loadRequest(request)
//        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "4th"
        let url = NSURL(string: "http://login.dogmadebate.com/")
        if let url = url {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
        
    }
    
    
}
