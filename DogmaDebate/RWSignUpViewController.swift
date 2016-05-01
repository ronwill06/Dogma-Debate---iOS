//
//  RWSignUpViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 3/30/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class RWSignUpViewController: UIViewController, PayPalPaymentDelegate, PayPalFuturePaymentDelegate, PayPalProfileSharingDelegate {
    
    
    @IBOutlet weak var signUpPremier: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var premiumButton: UIButton!
    
    override func viewDidAppear(animated: Bool) {
        
        UIWidgetCustomizer.createRoundedButton(signUpPremier, float: 18)
        UIWidgetCustomizer.createRoundedButton(plusButton, float: 18)
        UIWidgetCustomizer.createRoundedButton(premiumButton, float: 18)
    }
    
    
    @IBAction func signUpPremier(sender: AnyObject) {
        
        
    }
    
    @IBAction func signUpPlus(sender: AnyObject) {
        
        
    }
    
    
    @IBAction func signUpPremium(sender: AnyObject) {
        
        
    }
    
    
}
