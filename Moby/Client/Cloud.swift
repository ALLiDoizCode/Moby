//
//  Cloud.swift
//  Moby
//
//  Created by Jonathan on 10/27/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation
import Parse

class Cloud {
    
    func newCustomer() {
        
        PFCloud.callFunction(inBackground: "charge", withParameters: nil) { (response, error) in
            
            if error == nil {
                print("sucess")
                print(response.debugDescription)
            }else {
                
                print("Failed")
                print(error)
            }}
        
    }
}
