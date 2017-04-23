//
//  Constants.swift
//  Moby
//
//  Created by Jonathan on 2/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import UIKit
import Material
import SwiftyJSON

let captinCellID = "CaptinCell"

let USER_COLLECTION = "user"
let BOAT_COLLECTION = "boat"
let IMAGES_COLLECTION = "images"
let TRIP_COLLECTION = "trip"
let CHARGE_COLLECTION = "charge"

let STAGING = "https://moby-staging.herokuapp.com/"
let PRODUCTION = "https://mo-b.herokuapp.com/"

func baseURL(endpoint:String) -> String{
    
    return "\(STAGING)\(endpoint)"
}

let THEME_1 = UIColor(red:0.18, green:0.68, blue:0.98, alpha:1.0)
let THEME_2 = Color.grey.lighten5
let THEME_3 = UIColor(red:0.18, green:0.64, blue:0.98, alpha:1.0)

let TEXT_COLOR = Color.grey.darken1
let BORDER_COLOR = Color.grey.lighten1

let fontWidth = (UIScreen.main.bounds.width) * 0.034
let largeFontWidth = (UIScreen.main.bounds.width) * 0.075

func BOAT_MANUFACTURES() ->[String] {
    
    var manufactureArray:[String] = []
  
    if let file = Bundle.main.url(forResource: "Manufactures", withExtension: "json") {
        
        do {
            
            let data = try Data(contentsOf: file)
            
            let json = JSON(data: data)
            
            for i in 0..<json["selection1"].count {
                
                let name = json["selection1"][i]["name"].stringValue
                
                print(name)
                
                manufactureArray.append(name)
            }
            
        }catch{
            
        }
        
    }
    
    return manufactureArray
}

func BOAT_Type() ->[String] {
    
    var manufactureArray:[String] = []
    
    if let file = Bundle.main.url(forResource: "BoatType", withExtension: "json") {
        
        do {
            
            let data = try Data(contentsOf: file)
            
            let json = JSON(data: data)
            
            for i in 0..<json["selection1"].count {
                
                let name = json["selection1"][i]["name"].stringValue
                
                print(name)
                
                manufactureArray.append(name)
            }
            
        }catch{
            
        }
        
    }
    
    return manufactureArray
}

