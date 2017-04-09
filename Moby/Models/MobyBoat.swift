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
    var boatModel:String!
    var boatMake:String!
    var boatRules:String!
    var minTime:Int!
    var lat:Double!
    var long:Double!
    var rooms:Int!
    var restRooms:Int!
    var power:String!
    var title:String!
    var tripType:String!
    var instant:Bool!
    
    init() {
        
    }
    
    init(id:String,userId:String,size:Int,type:String,year:String,price:Int,passengers:String,location:String,description:String,boatModel:String,boatMake:String,boatRules:String,minTime:Int,lat:Double,long:Double,rooms:Int,restRooms:Int,power:String,title:String,tripType:String,instant:Bool){
        
        self.id = id
        self.userId = userId
        self.size = size
        self.type = type
        self.year = year
        self.price = price
        self.passengers = passengers
        self.location = location
        self.description = description
        self.boatModel = boatModel
        self.lat = lat
        self.long = long
        self.boatMake = boatMake
        self.boatRules = boatRules
        self.minTime = minTime
        self.rooms = rooms
        self.restRooms = restRooms
        self.power = power
        self.title = title
        self.tripType = tripType
        self.instant = instant
        
        
    }
}
