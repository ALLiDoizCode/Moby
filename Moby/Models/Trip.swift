//
//  Trip.swift
//  Moby
//
//  Created by Jonathan on 3/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class Trip {
    
    var id:String!
    var captin:String!
    var boat:String!
    var charge:String!
    var duration:Int!
    
    init(id:String,captin:String,boat:String,charge:String,duration:Int) {
        
        self.id = id
        self.captin = captin
        self.boat = boat
        self.charge = charge
        self.duration = duration
    }
}
