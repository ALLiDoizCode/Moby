//
//  Location.swift
//  Moby
//
//  Created by Jonathan on 1/29/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import MapKit
import Parse

struct Typealiases {
    typealias JSONDict = [String:Any]
}

class Location {
    
    let geoCoder = CLGeocoder()
    
    func getAdress(completion: @escaping (Typealiases.JSONDict) -> ()) {
        
        PFGeoPoint.geoPointForCurrentLocation { (geoLocation, error) in
            
            if error == nil {
                
                let lat = geoLocation?.latitude
                let long = geoLocation?.longitude
                
                let currentLocation = CLLocation(latitude: lat!, longitude: long!)
                
                
                let geoCoder = CLGeocoder()
                geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) -> Void in
                    
                    if error != nil {
                        print("Error getting location: \(error)")
                    } else {
                        let placeArray = placemarks as [CLPlacemark]!
                        var placeMark: CLPlacemark!
                        placeMark = placeArray?[0]
                        completion(placeMark.addressDictionary as! Typealiases.JSONDict)
                    }
                }
                
            }else {
                
                print(error)
            }
        
        }
        
    }
}
