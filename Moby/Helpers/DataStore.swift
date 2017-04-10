//
//  DataStore.swift
//  Moby
//
//  Created by Jonathan on 3/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class DataStore {
    
    private static var ACCESS_TOKEN:String!
    private static var USER:Fishermen!
    private static var newBoat:MobyBoat!
    private static var lat:Double!
    private static var long:Double!
    private static var location:String!
    private static var newTitle:String!
    private static var newType:String!
    private static var boatList:[(MobyBoat,[String])] = []
    
    
    func getTitle() -> String {
        
        return DataStore.newTitle
    }
    
    func getNewType() -> String {
        
        return DataStore.newType
    }
    
    func getLat() -> Double {
        
        return DataStore.lat
    }
    
    func getLong() -> Double {
        
        return DataStore.long
    }
    
    func getLocation() -> String {
        
        return DataStore.location
    }
    
    func getToken() -> String {
        
        return DataStore.ACCESS_TOKEN
    }
    
    func getUser() -> Fishermen{
        
        return DataStore.USER
    }
    
    func getBoat() -> MobyBoat{
        
        return DataStore.newBoat
    }
    
    func getBoatList() -> [(MobyBoat,[String])]{
        
        return DataStore.boatList
    }
    
    static func setToken(ACCESS_TOKEN:String){
        
        self.ACCESS_TOKEN = ACCESS_TOKEN
    }
    
    static func setUser(user:Fishermen){
        
        self.USER = user
        
    }
    
    static func setLat(lat:Double){
        
        self.lat = lat
        
    }
    
    static func setLong(long:Double){
        
        self.long = long
        
    }
    
    static func setLocation(location:String){
        
        self.location = location
        
    }
    
    static func setTitle(title:String){
        
        self.newTitle = title
        
    }
    
    static func setNewType(type:String){
        
        self.newType = type
        
    }
    
    static func setBoat(newBoat:MobyBoat){
        
        self.newBoat = newBoat
        
    }
    
    static func setBoatList(boatList:[(MobyBoat,[String])]){
        
        self.boatList = boatList
        
    }
}
