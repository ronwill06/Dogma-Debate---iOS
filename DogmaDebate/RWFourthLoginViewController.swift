//
//  RWFourthLoginViewController.swift
//  Dogma Debate
//
//  Created by Rondale Williams on 6/30/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class RWFourthLoginViewController : UIViewController {
    
    @IBOutlet weak var signUpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBarHidden = true
        signUpLabel.text = "Sign Up at: \nlogin.dogmadebate.com"
    }
    
    @IBAction func logIn(sender: AnyObject) {
        
    }
    
    
}
