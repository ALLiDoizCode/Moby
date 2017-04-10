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
import Material

class SetBoatLocationViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    var matchingItems:[MKMapItem] = []
    var mapView: MKMapView? = nil
    var tableView:UITableView!
    var newTitle = NewTitleView()
    var boatTypeView = BoatType()
    var headerView = UIView()
    var headerLabel = UILabel()
    
    let regionRadius: CLLocationDistance = 1000 * 30

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = THEME_2
        
        setup()
        constrainViews()
        
        LocationHelper().setupLocation { (items) in
            
            self.matchingItems = items
            self.tableView.reloadData()
            
            print("we have \(self.matchingItems.count) locations ")
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func constrainViews(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        newTitle.translatesAutoresizingMaskIntoConstraints = false
        newTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        newTitle.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0).isActive = true
        newTitle.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        newTitle.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        boatTypeView.translatesAutoresizingMaskIntoConstraints = false
        boatTypeView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        boatTypeView.bottomAnchor.constraint(equalTo: self.tabBar.topAnchor, constant: 0).isActive = true
        boatTypeView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        boatTypeView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 50).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20).isActive = true
    }
    
    func setup(){
        
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.view.addSubview(newTitle)
        self.view.addSubview(boatTypeView)
        //newTitle.frame = self.view.frame
        //boatTypeView.frame = self.view.frame
        tableView.isHidden = true
        newTitle.isHidden = true
        tableView.register(LocationTableViewCell.self, forCellReuseIdentifier: "landing")
        newTitle.save.addTarget(self, action: #selector(SetBoatLocationViewController.saveTitle), for: .touchUpInside)
        
        boatTypeView.button1.addTarget(self, action: #selector(SetBoatLocationViewController.saveFishing), for: .touchUpInside)
        boatTypeView.button2.addTarget(self, action: #selector(SetBoatLocationViewController.saveCruise), for: .touchUpInside)
        boatTypeView.button3.addTarget(self, action: #selector(SetBoatLocationViewController.saveParty), for: .touchUpInside)
        
        
        headerLabel.text = "Where Will Your Boat Be Docked?"
        headerLabel.textColor = THEME_1
        headerLabel.numberOfLines = 0
        headerLabel.font = RobotoFont.bold(with: largeFontWidth)
        
        headerView.backgroundColor = THEME_2
        headerView.addSubview(headerLabel)
    }
    
    func saveFishing(){
        
        DataStore.setNewType(type: "Fishing")
        boatTypeView.isHidden = true
        newTitle.isHidden = false
        
    }
    
    func saveCruise(){
        
        DataStore.setNewType(type: "Cruise")
        boatTypeView.isHidden = true
        newTitle.isHidden = false
        
    }
    
    func saveParty(){
        
        DataStore.setNewType(type: "Party")
        boatTypeView.isHidden = true
        newTitle.isHidden = false
        
    }
    
    func saveTitle(){
        
        guard newTitle.newTitle.text != "" else {
            
            print("Alert the users taht they need a title")
            
            return
        }
        
        newTitle.newTitle.resignFirstResponder()
        DataStore.setTitle(title:newTitle.newTitle.text!)
        newTitle.isHidden = true
        tableView.isHidden = false
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.frame.height * 0.20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return matchingItems.count
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
        
        DataStore.setLocation(location: mapItem.name!)
        DataStore.setLong(long: mapItem.placemark.coordinate.longitude)
        DataStore.setLat(lat: mapItem.placemark.coordinate.latitude)
        
        let controller = NewBoatViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
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
