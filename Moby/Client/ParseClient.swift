//
//  ParseClient.swift
//  Moby
//
//  Created by Jonathan on 10/30/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation
import Parse
import SwiftEventBus

class ParseClient {
    
    func signUp(fishermen:Fishermen,password:String) {
        let user = PFUser()
        user.username = fishermen.email
        user.password = password
        user.email = fishermen.email
        user["customerId"] = fishermen.customerId
        user["phone"] = fishermen.phone
        
        user.signUpInBackground { (success, error) in
            
            
        }
        
    }

}
