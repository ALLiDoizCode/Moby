//
//  Boat.swift
//  Moby
//
//  Created by Jonathan on 10/27/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation

class MobyBoat {
    
    var id:String!
    var userId:String!
    var size:Int!
    var type:String!
    var year:String!
    var price:Int!
    var passengers:String!
    var location:String!
    var description:String!
    var activities:String!
    var boatModel:String!
    var lat:Double!
    var long:Double!
    
    init(id:String,userId:String,size:Int,type:String,year:String,price:Int,passengers:String,location:String,description:String,activities:String,boatModel:String,lat:Double,long:Double){
        
        self.id = id
        self.userId = userId
        self.size = size
        self.type = type
        self.year = year
        self.price = price
        self.passengers = passengers
        self.location = location
        self.description = description
        self.activities = activities
        self.boatModel = boatModel
        self.lat = lat
        self.long = long
        
        
    }
}
