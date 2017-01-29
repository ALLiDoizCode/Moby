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
    
    private var subscription: Subscription<PFObject>!
    
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
    
    func saveTest(){
        
        let currentFishermen = Fishermen()
        
        currentFishermen.firstName = "Jonathan"
        currentFishermen.lastName = "Green"
        currentFishermen.email = "test@test.com"
        currentFishermen.status = true
        currentFishermen.customerId = "test"
        currentFishermen.phone = "test"
        currentFishermen.image = "test"
        
        currentFishermen.saveInBackground { (success, error) in
            
            
        }
    }
    
    func liveQuery(){
        
        print("subscribing to live query")
        
        let msgQuery = PFQuery(className:"Fishermen").whereKeyExists("status")
        
        
        self.subscription = liveQueryClient.subscribe(msgQuery).handleError({ (query, error) in
            
            print("error is \(error)")
        })
        
        self.subscription = liveQueryClient.subscribe(msgQuery).handleEvent({ (query, event) in
            
            print("event was \(event)")
        })
        
        self.subscription = liveQueryClient.subscribe(msgQuery).handle(Event.updated) { _, message in
            // This is where we handle the event
            
            print("created new fishermen")
        }
        
    }

}
