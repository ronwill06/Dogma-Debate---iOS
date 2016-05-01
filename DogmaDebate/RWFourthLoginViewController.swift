//
//  RWFourthLoginViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 1/10/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class RWFourthLoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField?
    @IBOutlet weak var passwordField: UITextField?
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "4th"
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameField?.text = nil
        passwordField?.text = nil
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    
    @IBAction func forgotPassword(sender: AnyObject) {
        
        
    }
    
  
    @IBAction func createAccount(sender: AnyObject) {
        let signUpViewController = RWSignUpViewController()
        self.navigationController?.presentViewController(signUpViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func logIn(sender: AnyObject) {
        
        
        let username = usernameField?.text
        let password = passwordField?.text
        
        guard let name = username else {return}
        guard let secret = password else {return}
        
       RWOAuthManager.sharedManager.authorizeUser(name, password: secret)
        
        if RWOAuthManager.sharedManager.isUserLoggedIn == true  {
           let fourthListenerVC = RWFourthListenerViewController()
            presentViewController(fourthListenerVC, animated: false, completion: nil)
        }
        

    }
    
    
}
