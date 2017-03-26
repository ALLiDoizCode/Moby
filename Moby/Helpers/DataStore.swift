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
    
    
    func getToken() -> String {
        
        return DataStore.ACCESS_TOKEN
    }
    
    func getUser() -> Fishermen{
        
        return DataStore.USER
    }
    
    static func setToken(ACCESS_TOKEN:String){
        
        self.ACCESS_TOKEN = ACCESS_TOKEN
    }
    
    static func setUser(user:Fishermen){
        
        self.USER = user
        
    }
}
