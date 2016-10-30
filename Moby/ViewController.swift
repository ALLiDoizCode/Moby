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

/// Point of Interest Item which implements the GMUClusterItem protocol.

class ViewController: UIViewController,GMSMapViewDelegate {

    var marker: GMSMarker!
    var londonView: UIImageView!
    var mapView:GMSMapView!
    
    var braintreeClient:BTAPIClient?
    
    let clientToken = "eyJ2ZXJzaW9uIjoyLCJhdXRob3JpemF0aW9uRmluZ2VycHJpbnQiOiI5YjM1MGE2Y2ZlODQzYTU4MTU5YzlkMTRkNzI1YmMyNGJiYzFmYzA3OGFhMmI2MDUwYzNkODk0MDBlZTk0ZjUzfGNyZWF0ZWRfYXQ9MjAxNi0xMC0zMFQwNzoxMzozOC4xMjg5MzgyNTYrMDAwMFx1MDAyNm1lcmNoYW50X2lkPTM0OHBrOWNnZjNiZ3l3MmJcdTAwMjZwdWJsaWNfa2V5PTJuMjQ3ZHY4OWJxOXZtcHIiLCJjb25maWdVcmwiOiJodHRwczovL2FwaS5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tOjQ0My9tZXJjaGFudHMvMzQ4cGs5Y2dmM2JneXcyYi9jbGllbnRfYXBpL3YxL2NvbmZpZ3VyYXRpb24iLCJjaGFsbGVuZ2VzIjpbXSwiZW52aXJvbm1lbnQiOiJzYW5kYm94IiwiY2xpZW50QXBpVXJsIjoiaHR0cHM6Ly9hcGkuc2FuZGJveC5icmFpbnRyZWVnYXRld2F5LmNvbTo0NDMvbWVyY2hhbnRzLzM0OHBrOWNnZjNiZ3l3MmIvY2xpZW50X2FwaSIsImFzc2V0c1VybCI6Imh0dHBzOi8vYXNzZXRzLmJyYWludHJlZWdhdGV3YXkuY29tIiwiYXV0aFVybCI6Imh0dHBzOi8vYXV0aC52ZW5tby5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tIiwiYW5hbHl0aWNzIjp7InVybCI6Imh0dHBzOi8vY2xpZW50LWFuYWx5dGljcy5zYW5kYm94LmJyYWludHJlZWdhdGV3YXkuY29tLzM0OHBrOWNnZjNiZ3l3MmIifSwidGhyZWVEU2VjdXJlRW5hYmxlZCI6dHJ1ZSwicGF5cGFsRW5hYmxlZCI6dHJ1ZSwicGF5cGFsIjp7ImRpc3BsYXlOYW1lIjoiQWNtZSBXaWRnZXRzLCBMdGQuIChTYW5kYm94KSIsImNsaWVudElkIjpudWxsLCJwcml2YWN5VXJsIjoiaHR0cDovL2V4YW1wbGUuY29tL3BwIiwidXNlckFncmVlbWVudFVybCI6Imh0dHA6Ly9leGFtcGxlLmNvbS90b3MiLCJiYXNlVXJsIjoiaHR0cHM6Ly9hc3NldHMuYnJhaW50cmVlZ2F0ZXdheS5jb20iLCJhc3NldHNVcmwiOiJodHRwczovL2NoZWNrb3V0LnBheXBhbC5jb20iLCJkaXJlY3RCYXNlVXJsIjpudWxsLCJhbGxvd0h0dHAiOnRydWUsImVudmlyb25tZW50Tm9OZXR3b3JrIjp0cnVlLCJlbnZpcm9ubWVudCI6Im9mZmxpbmUiLCJ1bnZldHRlZE1lcmNoYW50IjpmYWxzZSwiYnJhaW50cmVlQ2xpZW50SWQiOiJtYXN0ZXJjbGllbnQzIiwiYmlsbGluZ0FncmVlbWVudHNFbmFibGVkIjp0cnVlLCJtZXJjaGFudEFjY291bnRJZCI6ImFjbWV3aWRnZXRzbHRkc2FuZGJveCIsImN1cnJlbmN5SXNvQ29kZSI6IlVTRCJ9LCJjb2luYmFzZUVuYWJsZWQiOmZhbHNlLCJtZXJjaGFudElkIjoiMzQ4cGs5Y2dmM2JneXcyYiIsInZlbm1vIjoib2ZmIn0="

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //createMap()
        
        //Cloud().newCustomer()
        
        braintreeClient = BTAPIClient(authorization: clientToken)
        
        tappedMyPayButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tappedMyPayButton() {
        
        // If you haven't already, create and retain a `BTAPIClient` instance with a
        // tokenization key OR a client token from your server.
        // Typically, you only need to do this once per session.
        // braintreeClient = BTAPIClient(authorization: CLIENT_AUTHORIZATION)
        
        // Create a BTDropInViewController
        let dropInViewController = BTDropInViewController(apiClient: braintreeClient!)
        dropInViewController.delegate = self
        
        // This is where you might want to customize your view controller (see below)
        
        // The way you present your BTDropInViewController instance is up to you.
        // In this example, we wrap it in a new, modally-presented navigation controller:
        dropInViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.cancel,
            target: self, action: #selector(ViewController.userDidCancelPayment))
        let navigationController = UINavigationController(rootViewController: dropInViewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    func userDidCancelPayment() {
        dismiss(animated: true, completion: nil)
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

