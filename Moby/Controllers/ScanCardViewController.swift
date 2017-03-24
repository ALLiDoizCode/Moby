//
//  ScanCardViewController.swift
//  IGOTU
//
//  Created by Jonathan on 1/15/17.
//  Copyright © 2017 OleShack. All rights reserved.
//

import UIKit
import SVProgressHUD
import Cartography
import Material
import Stripe

class ScanCardViewController: UIViewController,CardIOPaymentViewControllerDelegate {
    
    //var email:String!
    //var password:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                
        //open cardIO controller to scan the card
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC?.modalPresentationStyle = .formSheet
        present(cardIOVC!, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
    }
    
    func userDidProvide(_ cardInfo: CardIOCreditCardInfo!, in paymentViewController: CardIOPaymentViewController!) {
        
        if let info = cardInfo {
            let str = NSString(format: "Received card info.\n Number: %@\n expiry: %02lu/%lu\n cvv: %@.", info.redactedCardNumber, info.expiryMonth, info.expiryYear, info.cvv)
            print(str)
        
        //dismiss scanning controller
        paymentViewController?.dismiss(animated: true, completion: nil)
        
        //create Stripe card
        let card: STPCardParams = STPCardParams()
        card.number = info.cardNumber
        card.expMonth = info.expiryMonth
        card.expYear = info.expiryYear
        card.cvc = info.cvv
        card.currency = "USD"
            
        //Send to Stripe
            
           let STP = STPAPIClient(publishableKey: "pk_test_mZhuo10GuRr7kztp40vrBe8m")
            
            STP.createToken(withCard: card, completion: { (token, error) in
                
                if error == nil {
                    
                    if let token = token {
                        
                        STP.createToken(withCard: card, completion: { (token2, error) in
                            
                            if error == nil {
                                
                                if let token2 = token2 {
                                    
                                    let image = UIImage(named: "guy")
                                    
                                    print("card1\(token.stripeID)")
                                    print("card2\(token2.stripeID)")
                                    
                                    /*Client().token(completion: { (authToken) in
                                        
                                        Client().auth(token: authToken, completion: { (success) in
                                            
                                            if success == true {
                                                
                                                Client().newUser(firstName: "Jonathan", lastName: "Green", phone: "5555555555", email: "amber@amber.com", password: "123", rating: 4.2, active: false, rules: "no rules", Image: image!, card1: token.stripeID, card2: token2.stripeID)
                                            }
                                        })
                                    })*/
                                }
                                
                            }else {
                                
                                
                                print(error)
                            }
                            
                            
                        })
                    }
                    
                }else {
                    
                    
                    print(error)
                }
                
                
            })
        }
    }
    
    func userDidCancel(_ paymentViewController: CardIOPaymentViewController!) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        CardIOUtilities.preload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
