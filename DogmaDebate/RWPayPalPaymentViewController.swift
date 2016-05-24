//
//  RWPayPalPaymentViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/22/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWPayPalPaymentViewController: UIViewController, PayPalPaymentDelegate {
    
    @IBOutlet weak var paymentAmountTextField: UITextField!
    
    
    let paypalConfiguration: PayPalConfiguration? = PayPalConfiguration()
    
    static func paymentViewController() -> RWPayPalPaymentViewController {
        let vc =  UIStoryboard(name: "PayPalPaymentViewController", bundle: nil).instantiateInitialViewController() as! RWPayPalPaymentViewController
        return vc
    }
    
    override func viewDidLoad() {
        
        self.paypalConfiguration?.acceptCreditCards = true
        self.paypalConfiguration?.payPalShippingAddressOption = .PayPal
    }
    
    override func viewWillAppear(animated: Bool) {
        PayPalMobile.preconnectWithEnvironment(PayPalEnvironmentNoNetwork)
        
    }
    
    func verifyCompletedPayment(completedPayment: PayPalPayment) {
        do {
        _ = try NSJSONSerialization.dataWithJSONObject(completedPayment.confirmation, options: NSJSONWritingOptions(rawValue:0))
            
        } catch {
            
        }
    }
    
    @IBAction func pay(sender: AnyObject) {
        let payment = PayPalPayment()
        
        payment.amount = NSDecimalNumber(string: paymentAmountTextField.text)
        payment.currencyCode =  "USD"
        payment.intent = .Sale
        payment.shortDescription = "Dogma Debate Membership"
        
        let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: paypalConfiguration, delegate: self)
        
        if let paymentViewController = paymentViewController {
            self.presentViewController(paymentViewController, animated: true, completion: nil)
        }
        
        
    }
    
    func payPalPaymentViewController(paymentViewController: PayPalPaymentViewController, didCompletePayment completedPayment: PayPalPayment) {
       self.verifyCompletedPayment(completedPayment)
       self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func payPalPaymentDidCancel(paymentViewController: PayPalPaymentViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}