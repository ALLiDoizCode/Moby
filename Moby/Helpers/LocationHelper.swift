//
//  LocationHelper.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import MapKit
import SwiftLocation

class LocationHelper {
    
    func viewWaze(location : CLLocation) {
        
        let latitude:Double = location.coordinate.latitude;
        let longitude:Double = location.coordinate.longitude;
        
        let location2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        //var link:String = "waze://"
        let url:URL = URL(string: "waze://?ll=\(latitude),\(longitude)&navigate=yes")!
        
        if UIApplication.shared.canOpenURL(url) {
            
            UIApplication.shared.open(url)
            UIApplication.shared.isIdleTimerDisabled = true
            
        } else {
            
            /*link = "http://itunes.apple.com/us/app/id323229106"
             UIApplication.shared.open(url, completionHandler: nil)
             UIApplication.shared.isIdleTimerDisabled = true*/
            
            let place = MKPlacemark(coordinate: location2D)
            
            getDirections(place: place)
        }
        
    }
    
    func setupLocation(comepltion:@escaping (_ items:[MKMapItem]) -> Void){
        
        DispatchQueue.main.async {
            
            Location.getLocation(withAccuracy: .city, onSuccess: { (location) in
                
                print("location success")
                
                let request = MKLocalSearchRequest()
                request.naturalLanguageQuery = "boat landing"
                request.region.center = CLLocationCoordinate2DMake(32.921898, -79.900247)
                let search = MKLocalSearch(request: request)
                search.start { response, _ in
                    
                    guard let response = response else {
                        return
                    }
                    
                    comepltion(response.mapItems)
                }
                
                
            }) { (location, error) in
                
                print("location failed")
                
                let request = MKLocalSearchRequest()
                request.naturalLanguageQuery = "boat landing"
                request.region.center = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
                let search = MKLocalSearch(request: request)
                search.start { response, _ in
                    guard let response = response else {
                        return
                    }
                    
                    comepltion(response.mapItems)
                    
                }
            }
        }
    }
    
    func getDirections(place:MKPlacemark){
        
        let mapItem = MKMapItem(placemark: place)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: launchOptions)
        
    }

}
