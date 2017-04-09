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
    private static var boatList:[(MobyBoat,[String])] = []
    
    
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
    
    static func setBoat(newBoat:MobyBoat){
        
        self.newBoat = newBoat
        
    }
    
    static func setBoatList(boatList:[(MobyBoat,[String])]){
        
        self.boatList = boatList
        
    }
}
