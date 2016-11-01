//
//  ViewController.swift
//  Moby
//
//  Created by Jonathan on 10/26/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import UIKit
import GoogleMaps
import Braintree

import Material
/// Point of Interest Item which implements the GMUClusterItem protocol.

class ViewController: UIViewController,GMSMapViewDelegate {

    var marker: GMSMarker!
    var londonView: UIImageView!
    var mapView:GMSMapView!
    
    //let parseClient = ParseClient()
    
    //let client = Client.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        createMap()
        
        //Cloud().newCustomer()
        
                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func createMap(){
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 51.5, longitude: -0.127, zoom: 6.0)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView
        
        let boat = UIImage(named: "boat")!.withRenderingMode(.alwaysTemplate)
        let markerView = UIImageView(image: boat)
        markerView.tintColor = UIColor.red
        self.londonView = markerView
        
        // Creates a marker in the center of the map.
        let position = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.127)
        let london = GMSMarker(position: position)
        london.title = "London"
        london.isFlat = true
        london.icon = UIImage(named: "boat")
        london.map = mapView
        
        let position2 = CLLocationCoordinate2D(latitude: 51.2, longitude: -0.177)
        let london2 = GMSMarker(position: position2)
        london2.title = "London"
        london2.isFlat = true
        london2.icon = UIImage(named: "boat")
        london2.map = mapView
        
        let position3 = CLLocationCoordinate2D(latitude: 51.8, longitude: -0.172)
        let london3 = GMSMarker(position: position3)
        london3.title = "London"
        london3.isFlat = true
        london3.icon = UIImage(named: "boat")
        london3.map = mapView
        
        // The myLocation attribute of the mapView may be null
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
        
        mapView.settings.myLocationButton = true
        
        mapView.delegate = self
        
    
       
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        UIView.animate(withDuration: 5.0, animations: { () -> Void in
            self.londonView?.tintColor = UIColor.blue
            }, completion: {(finished: Bool) -> Void in
                // Stop tracking view changes to allow CPU to idle.
                self.marker?.tracksViewChanges = false
        })
    }

}

