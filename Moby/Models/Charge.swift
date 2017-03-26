//
//  Charge.swift
//  Moby
//
//  Created by Jonathan on 3/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class Charge {
    
    var id:String!
    var customer:String!
    var charge:String!
  
    
    init(id:String,customer:String,charge:String) {
        
        self.id = id
        self.customer = customer
        self.charge = charge
        
    }
}
