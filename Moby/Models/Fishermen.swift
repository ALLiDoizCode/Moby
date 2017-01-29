//
//  Fishermen.swift
//  Moby
//
//  Created by Jonathan on 10/27/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation
import Parse

class Fishermen:PFObject, PFSubclassing {
    
    @NSManaged var firstName:String!
    @NSManaged var lastName:String!
    @NSManaged var image:String!
    @NSManaged var email:String!
    @NSManaged var phone:String!
    @NSManaged var customerId:String!
    @NSManaged var status:NSNumber!
    
    class func parseClassName() -> String {
        return "Fishermen"
    }
}
