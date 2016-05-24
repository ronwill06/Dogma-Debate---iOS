//
//  RWSignUpViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 3/30/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import UIKit

class RWSignUpViewController: UIViewController, PayPalPaymentDelegate, PayPalFuturePaymentDelegate {
    
     let paypalConfiguration: PayPalConfiguration = PayPalConfiguration()
    
    @IBOutlet weak var signUpPremier: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var premiumButton: UIButton!
    
    override func viewDidLoad() {
        paypalConfiguration.merchantName = "Secular Media Group, LLC"
        paypalConfiguration.merchantPrivacyPolicyURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full?country.x=US&locale.x=en_US")
        paypalConfiguration.merchantUserAgreementURL = NSURL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full?country.x=US&locale.x=en_US")
    }
    
    override func viewWillAppear(animated: Bool) {
        PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentNoNetwork)

    }
    
    override func viewDidAppear(animated: Bool) {
        
        paypalConfiguration.acceptCreditCards = true
        paypalConfiguration.payPalShippingAddressOption = .PayPal
        
        UIWidgetCustomizer.createRoundedButton(signUpPremier, float: 18)
        UIWidgetCustomizer.createRoundedButton(plusButton, float: 18)
        UIWidgetCustomizer.createRoundedButton(premiumButton, float: 18)
    }
    
    
    
    func verifyCompletedPayment(completedPayment: PayPalPayment) {
        do {
            let confirmation = try NSJSONSerialization.dataWithJSONObject(completedPayment.confirmation, options: NSJSONWritingOptions(rawValue:0))
            
        } catch {
            
        }
    }
    
    func sendAuthorizationToServer(authorization: [NSObject: AnyObject]) {
        
        do {
            let consentJSONData = try NSJSONSerialization.dataWithJSONObject(authorization, options: NSJSONWritingOptions(rawValue: 0))
            
            
        } catch {
            
        }
    }

    
    @IBAction func signUpPremier(sender: AnyObject) {
       
        let payment = PayPalPayment()
        
        payment.amount = NSDecimalNumber(string: "4.00")
        payment.currencyCode = "USD"
        payment.intent = .Sale
        payment.shortDescription = "Dogma Debate Premier Membership"
        
        let paymentViewController = PayPalFuturePaymentViewController(configuration: paypalConfiguration, delegate: self)
        
        if let paymentViewController = paymentViewController {
            self.presentViewController(paymentViewController, animated: true, completion: nil)
        }
        
        // Display activity indicator...


        let metadataID = PayPalMobile.clientMetadataID()
        
        
    }
    
    @IBAction func signUpPlus(sender: AnyObject) {
        let payment = PayPalPayment()
        
        payment.amount = NSDecimalNumber(string: "10.00")
        payment.currencyCode = "USD"
        payment.intent = .Sale
        payment.shortDescription = "Dogma Debate Plus Membership"
        
       let paymentViewController = PayPalFuturePaymentViewController(configuration: paypalConfiguration, delegate: self)
        
        if let paymentViewController = paymentViewController {
            self.presentViewController(paymentViewController, animated: true, completion: nil)
        }

        // Display activity indicator...

        
        
         let metadataID = PayPalMobile.clientMetadataID()
    }
    
    
    @IBAction func signUpPremium(sender: AnyObject) {
        let payment = PayPalPayment()
        
        payment.amount = NSDecimalNumber(string: "25.00")
        payment.currencyCode = "USD"
        payment.intent = .Sale
        payment.shortDescription = "Dogma Debate Premium Membership"
        
        let paymentViewController = PayPalFuturePaymentViewController(configuration: paypalConfiguration, delegate: self)
        
        if let paymentViewController = paymentViewController {
            self.presentViewController(paymentViewController, animated: true, completion: nil)
        }
        
        // Display activity indicator...

        
         let metadataID = PayPalMobile.clientMetadataID()

    }
    
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController, didCompletePayment completedPayment: PayPalPayment) {
        self.verifyCompletedPayment(completedPayment)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalFuturePaymentViewController(futurePaymentViewController: PayPalFuturePaymentViewController, didAuthorizeFuturePayment futurePaymentAuthorization: [NSObject : AnyObject]) {
        
         self.sendAuthorizationToServer(futurePaymentAuthorization)
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalFuturePaymentDidCancel(futurePaymentViewController: PayPalFuturePaymentViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
}
