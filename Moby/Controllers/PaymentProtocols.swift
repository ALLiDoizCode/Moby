//
//  PaymentProtocols.swift
//  Moby
//
//  Created by Jonathan on 10/30/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation
import UIKit
import Braintree
import SwiftEventBus


extension ViewController:BTDropInViewControllerDelegate {
    public func drop(_ viewController: BTDropInViewController, didSucceedWithTokenization paymentMethodNonce: BTPaymentMethodNonce){
        
        client.makeCustomer(firstName: "Jonathan", lastName: "Green", email: "di3twater@gmail.com", phone: "555-555-5555") { (customerId) in
            
            //parseClient.signUp()
        }
        
        print("got payment")
        
    }
    
    
    /// Informs the delegate when the user has decided to cancel out of the Drop-in payment form.
    ///
    /// Drop-in handles its own error cases, so this cancelation is user initiated and
    /// irreversable. Upon receiving this message, you should dismiss Drop-in.
    ///
    /// @param viewController The Drop-in view controller informing its delegate of failure or cancelation.
    public func drop(inViewControllerDidCancel viewController: BTDropInViewController){
        
    }
    
   
}
