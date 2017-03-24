//
//  BankViewController.swift
//  Moby
//
//  Created by Jonathan on 3/24/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import plaid_ios_link
import plaid_ios_sdk

class BankViewController: UIViewController,PLDLinkNavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let plaidLink = PLDLinkNavigationViewController(environment: .tartan, product: .connect)
        plaidLink?.linkDelegate = self
        plaidLink?.providesPresentationContextTransitionStyle = true
        plaidLink?.definesPresentationContext = true
        plaidLink?.modalPresentationStyle = .custom
        
        self.present(plaidLink!, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func linkNavigationControllerDidFinish(withBankNotListed navigationController: PLDLinkNavigationViewController!) {
        
    }
    
    func linkNavigationControllerDidCancel(_ navigationController: PLDLinkNavigationViewController!) {
        
    }
    
    func linkNavigationContoller(_ navigationController: PLDLinkNavigationViewController!, didFinishWithAccessToken accessToken: String!) {
        
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
