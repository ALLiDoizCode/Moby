//
//  SetBoatLocationViewController.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import MapKit
import SwiftLocation

class SetBoatLocationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var tableView:UITableView!
    
    let regionRadius: CLLocationDistance = 1000 * 30

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "landing")
        
        setupLocation()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLocation(){
        
        Location.getLocation(withAccuracy: .city, onSuccess: { (location) in
            
            print("location sucess")
            
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = "boat landing"
            request.region.center = CLLocationCoordinate2DMake(32.921898, -79.900247)
            let search = MKLocalSearch(request: request)
            search.start { response, _ in
                guard let response = response else {
                    return
                }
                self.matchingItems = response.mapItems
                
                self.tableView.reloadData()
                
                for place in self.matchingItems {
                    
                    print("place name is \(place.name!)")
                    print("\(self.parseAddress(selectedItem: place.placemark))")
                }
                
            }
            
            
        }) { (location, error) in
            
            print("location failed")
            
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = "boat landing"
            request.region.center = CLLocationCoordinate2DMake(32.921898, -79.900247)
            let search = MKLocalSearch(request: request)
            search.start { response, _ in
                guard let response = response else {
                    return
                }
                self.matchingItems = response.mapItems
                
                self.tableView.reloadData()
                
                for place in self.matchingItems {
                    
                    print("place name is \(place.name!)")
                    print("\(self.parseAddress(selectedItem: place.placemark))")
                }
                
            }
        }
    }
    
    func getDirections(place:MKPlacemark){
        
        let mapItem = MKMapItem(placemark: place)
        let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        mapItem.openInMaps(launchOptions: launchOptions)
        
    }
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        // put a space between "4" and "Melrose Place"
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? " " : ""
        // put a comma between street and city/state
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? ", " : ""
        // put a space between "Washington" and "DC"
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? " " : ""
        let addressLine = String(
            format:"%@%@%@%@%@%@%@",
            // street number
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            // street name
            selectedItem.thoroughfare ?? "",
            comma,
            // city
            selectedItem.locality ?? "",
            secondSpace,
            // state
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return matchingItems.count
    }
    
    func canOpenWaze(url:URL) -> Bool{
    
        
        if UIApplication.shared.openURL(url)
        {
            return true
            
        } else {
            
            return false
        }
    }
    
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "landing", for: indexPath) as! LocationTableViewCell
        
        cell.name.text = matchingItems[indexPath.row].name
        cell.address.text = parseAddress(selectedItem: matchingItems[indexPath.row].placemark)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mapItem = matchingItems[indexPath.row]
        
        viewWaze(location: CLLocation(latitude: mapItem.placemark.coordinate.latitude, longitude: mapItem.placemark.coordinate.longitude))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
