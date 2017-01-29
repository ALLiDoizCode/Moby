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
import ParseLiveQuery

let liveQueryClient = ParseLiveQuery.Client(server:"wss://moby.back4app.io")

class ParseClient {
    
    let currentUser = PFUser.current()
    let currentObjectId = PFUser.current()?.objectId
    let currentUserName = PFUser.current()?.username
    
    func signIn(completion:@escaping () -> Void) {
        
        PFUser.logInWithUsername(inBackground: "jon@jon.com", password: "123") { (user, error) in
            
            completion()
        }
    }
    
    func signUp(fishermen:Fishermen,password:String,completion:@escaping () ->Void) {
        
        let user = PFUser()
        user.username = fishermen.email
        user.password = password
        user.email = fishermen.email
        user["customerId"] = fishermen.customerId
        user["phone"] = fishermen.phone
        
        user.signUpInBackground { (success, error) in
            
            if error == nil {
                
                 completion()
                
            }else{
                print("signup error is \(error)")
            }
        }
        
    }
    
}
