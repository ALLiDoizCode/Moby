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
    var boats:[String]!
    
    init(_firstName:String,_lastName:String,_email:String,_Phone:String,_merchantId:String) {
        
        firstName = _firstName
        lastName = _lastName
        email = _email
        phone = _Phone
        merchantId = _merchantId
    }
}
