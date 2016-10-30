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


extension ViewController:BTDropInViewControllerDelegate {
    public func drop(_ viewController: BTDropInViewController, didSucceedWithTokenization paymentMethodNonce: BTPaymentMethodNonce){
        
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
