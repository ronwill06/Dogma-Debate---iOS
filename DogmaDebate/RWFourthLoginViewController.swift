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
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidden = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        navigationController?.navigationBarHidden = true
        signUpLabel.text = "Sign Up at: \nlogin.dogmadebate.com"
        
        registerNotifications()
    }
    
    @IBAction func logIn(sender: AnyObject) {
        guard let username = usernameTextField.text, password = passwordTextField.text else { return }
        let authManager = RWOAuthManager.sharedManager
        authManager.authorizeUser(username, password: password)
        
        if authManager.loading == true {
            activityIndicator.hidden = false
            activityIndicator.startAnimating()
        }

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func registerNotifications() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RWFourthLoginViewController.userLoggedIn(_:)), name: NotificationKeys.UserEnabledNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RWFourthLoginViewController.userFailedLogIn(_:)), name: NotificationKeys.UserFailedNotification, object: nil)
    }
    
    @objc func userLoggedIn(notification: NSNotification) {
        activityIndicator.hidden = true
        activityIndicator.stopAnimating()
        
        if let userInfo = notification.userInfo as? [String : Bool] {
            if let isEnabled = userInfo["enabled"] {
                if isEnabled == true {
                    let viewModel = FourthListenerViewModel()
                    let fourthVC = FourthListenerViewController.fourthListenerViewController()
                    fourthVC.fourthListenerViewModel = viewModel
                    navigationController?.pushViewController(fourthVC, animated: true)
                }
            }
        }
    }
    
    @objc func userFailedLogIn(notification: NSNotification) {
        activityIndicator.hidden = true
        activityIndicator.stopAnimating()

        if let userInfo = notification.userInfo as? [String : Bool] {
            if let isEnabled = userInfo["enabled"] {
                if isEnabled == false {
                    let alertView = UIAlertView()
                    alertView.title = "Incorrect Password"
                    alertView.message = "We could not log you in. Please try again."
                    alertView.addButtonWithTitle("Dismiss")
                    alertView.cancelButtonIndex = 0
                    alertView.show()
                }
            }
        }
    }
    
}

extension RWFourthLoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.resignFirstResponder()
        if textField == usernameTextField {
            textField.resignFirstResponder()
        }
        
        if textField == passwordTextField {
            textField.resignFirstResponder()
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
