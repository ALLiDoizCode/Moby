//
//  Fishermen.swift
//  Moby
//
//  Created by Jonathan on 10/27/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation

class Fishermen {
    
    var id:String!
    var firstName:String!
    var lastName:String!
    var image:String!
    var phone:String!
    var connectId:String!
    var customerId:String!
    var email:String!
    var rating:String!
    
    init(id:String,firstName:String,lastName:String,image:String,phone:String,connectId:String,customerId:String,email:String,rating:String){
        
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.phone = phone
        self.connectId = connectId
        self.customerId = customerId
        self.email = email
        self.rating = rating
        
    }
    
}


