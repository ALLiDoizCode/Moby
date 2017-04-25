//
//  SearchClient.swift
//  Moby
//
//  Created by Jonathan on 3/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftEventBus
import SwiftyJSON


class SearchClient {
    
    let headers: HTTPHeaders = [
        //"Content-Length": "68",
        "Content-Type" : "application/json"
    ]
    
    func findCollections(collection:String,search:SearchModel,completion:@escaping (_ object:[AnyObject]) -> Void){
        
        var objects:[AnyObject] = []
        
        print("key one is \(search.key1)")
        
        
        let parameters = [
            
            "collection":collection,
            "key1": search.key1,
            "key2": search.key2,
            "key3": search.key3,
            "value1": search.value1,
            "value2": search.value2,
            "value3": search.value3,
            "skip":0,
            "limit":20
        
        ] as [String : Any]
        
        Alamofire.request(baseURL(endpoint: "water/find"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseString{ (response) in
            
            let json = JSON(data: response.data!)
            
            //print("query response JSON is \(json)")
            //print("response is \(response.result.value)")
            //print("response degub is \(response.debugDescription)")
            //print("response request is \(response.request)")
            //print("response reponse is \(response.response)")
            
            let count = json.count
            
            //print("number of objects found \(count)")
            
            for object in json {
                
            switch collection {
                 
                 case USER_COLLECTION:
                   // print("Got User")
                 
                    let id = object.1["_id"].stringValue
                    let connectId = object.1["connectId"].stringValue
                    let customerId = object.1["customerId"].stringValue
                    let email = object.1["email"].stringValue
                    let firstName = object.1["firstName"].stringValue
                    let lastName = object.1["lastName"].stringValue
                    let phone = object.1["phone"].stringValue
                    let profileImage = object.1["profileImage"].stringValue
                    let rating = object.1["rating"].stringValue
                    let isCaptin = object.1["isCaptin"].boolValue
                 
                    let fishermen = Fishermen(firstName: firstName, lastName: lastName, image: profileImage, phone: phone, connectId: connectId, customerId: customerId, email: email,rating:rating,isCaptin:isCaptin)
                    
                    fishermen.id = id
                 
                    objects.append(fishermen)
                
                
                 case BOAT_COLLECTION:
                   // print("Got Boat")
                 
                    let id = object.1["_id"].stringValue
                    let userId = object.1["userId"].stringValue
                    let size = object.1["size"].intValue
                    let type = object.1["type"].stringValue
                    let year = object.1["year"].stringValue
                    let price = object.1["price"].intValue
                    let passengers = object.1["passengers"].stringValue
                    let location = object.1["location"].stringValue
                    let description = object.1["description"].stringValue
                    let boatModel = object.1["boatModel"].stringValue
                    let boatMake = object.1["boatMake"].stringValue
                    let boatRules = object.1["boatRules"].stringValue
                    let minTime = object.1["minTime"].intValue
                    let lat = object.1["lat"].doubleValue
                    let long = object.1["lat"].doubleValue
                    let power = object.1["power"].stringValue
                    let rooms = object.1["rooms"].intValue
                    let restRooms = object.1["restRooms"].intValue
                    let title = object.1["title"].stringValue
                    let tripType = object.1["tripType"].stringValue
                    let instant = object.1["instant"].boolValue
                    let active = object.1["active"].boolValue
                    
                    let boat = MobyBoat(id: id, userId: userId, size: size, type: type, year: year, price: price, passengers: passengers, location: location, description: description, boatModel: boatModel, boatMake: boatMake, boatRules: boatRules, minTime: minTime, lat: lat, long: long,rooms:rooms,restRooms:restRooms,power:power,title:title,tripType:tripType,instant:instant,active:active)
                 
                
                    //print("boat price is \(price)")
                    //print("boat lat is \(lat)")
                    //print("boat lat is \(long)")
                  
                    objects.append(boat)
                
                 case IMAGES_COLLECTION:
                    
                    //print("Got Boat images")
                 
                    let id = object.1["_id"].stringValue
                    let boatId = object.1["boatId"].stringValue
                    let main = object.1["main"].boolValue
                    let Image = object.1["boatImage"].stringValue
                    
                 
                    let boatImage = BoatImages(id: id, boatId: boatId, main: main, Image: Image)
                    objects.append(boatImage)
                
                 case TRIP_COLLECTION:
                    //print("Got Trip")
                 
                    let id = object.1["_id"].stringValue
                    let captin = object.1["captin"].stringValue
                    let boat = object.1["boat"].stringValue
                    let charge = object.1["charge"].stringValue
                    let duration = object.1["duration"].intValue
                 
                    let trip = Trip(id: id, captin: captin, boat: boat, charge: charge, duration: duration)
                    objects.append(trip)
                
                 case CHARGE_COLLECTION:
                    //print("Got Charge")
                 
                    let id = object.1["_id"].stringValue
                    let customer = object.1["customer"].stringValue
                    let chargeId = object.1["charge"].stringValue
                 
                    let charge = Charge(id: id, customer: customer, charge: chargeId)
                    objects.append(charge)
                
                
                 default:
                    break
                }
            }
            
            completion(objects)
            
        }
    }
    
    func updateCollection(collection:String,search:SearchModel,completion:(_ object:AnyObject) -> Void) {
        
        let parameters = [
            
            "collection":collection,
            "key1": search.key1,
            "key2": search.key2,
            "key3": search.key3,
            "key4": search.key4,
            "key5": search.key5,
            "key6": search.key6,
            "key7": search.key7,
            "key8": search.key8,
            "key9": search.key9,
            "key10": search.key10,
            "key11": search.key11,
            "key12": search.key12,
            "value1": search.value1,
            "value2": search.value2,
            "value3": search.value3,
            "value4": search.value4,
            "value5": search.value5,
            "value6": search.value6,
            "value7": search.value7,
            "value8": search.value8,
            "value9": search.value9,
            "value10": search.value10,
            "value11": search.value11,
            "value12": search.value12
            
            
            ]
        
        Alamofire.request(baseURL(endpoint: "water/update"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).validate().responseJSON{ (response) in
            
            let json = JSON(response.result.value!)
            
            print("user response JSON is \(json)")
            print("response is \(response)")
            print("response degub is \(response.debugDescription)")
            print("response request is \(response.request)")
            print("response reponse is \(response.response)")
            
            switch collection {
                
            case "user":
                print("Update User")
                
                
            case "boat":
                print("Got Boat")
                
            default:
                break
            }
            
            
        }
    }
}
