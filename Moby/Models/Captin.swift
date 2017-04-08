//
//  Captin.swift
//  Moby
//
//  Created by Jonathan on 10/27/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation

class Captin {
    
    
    var firstName:String!
    var lastName:String!
    var image:String!
    var email:String!
    var phone:String!
    var merchantId:String!
    var active:Bool!
    
    init(_firstName:String,_lastName:String,_email:String,_Phone:String,_merchantId:String,active:Bool) {
        
        self.firstName = _firstName
        self.lastName = _lastName
        self.email = _email
        self.phone = _Phone
        self.merchantId = _merchantId
        self.active = active
    }
}
