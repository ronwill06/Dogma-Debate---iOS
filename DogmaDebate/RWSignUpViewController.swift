//
//  RWSignUpViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 3/30/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class RWSignUpViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    
    
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
    
    @IBAction func moreInfo(sender: AnyObject) {
        
        let infoViewController = RWMemberPackageViewController.memberPackageViewController()
        infoViewController.modalPresentationStyle = .FormSheet
        self.presentViewController(infoViewController, animated: true, completion: nil)
        
        if let popoverViewController = infoViewController.popoverPresentationController {
        popoverViewController.permittedArrowDirections = .Up
        
        popoverViewController.delegate = self;
        
        // in case we don't have a bar button as reference
        popoverViewController.sourceView = self.view;
        popoverViewController.sourceRect = CGRectMake(30, 50, 10, 10);
        }
        
    }
    
    func popoverPresentationControllerShouldDismissPopover(popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return true
    }
}
