//
//  NewBoatViewController.swift
//  Moby
//
//  Created by Jonathan on 4/6/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import NVActivityIndicatorView
import CDAlertView

class NewBoatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,
UINavigationControllerDelegate,NVActivityIndicatorViewable {
    
    var tableView:UITableView!
    var headerView = UIView()
    var bgImageView = PictureViews()
    var addImageIcon = IconView()
    var picker = UIPickerView()
    var currentList:[String] = []
    var currentIndex:Int!
    var priceView = PriceView()
    var rulesView = RulesView()
    var descriptionView = RulesView()
    var boatModelView = RulesView()
    var saveView = SaveView()
    var backButton = FlatButton()
    let imagePicker = UIImagePickerController()
    var boat = MobyBoat()
 
    var optionArray:[String] = ["Make","Year Built","Boat Model","Boat Type","Boat Rules","Description","Passengers","Size","Price","Min Time","Power","Rooms","Restrooms"]
    
    var minHours:[String] = ["None","1","2","3","4"]
    
    var passengers:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    
    var propulsion:[String] = ["Power","Sail","Paddle"]
    
    var sizes:[String] = []
    
    var years:[String] = []
    
    var completedRows:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: date)
        
        for i in 0..<61 {
            
            sizes.append("\(i)")
        }
        
        for i in 1950..<year {
            
            years.append("\(i)")
        }
        
        setup()
        constrainViews()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func constrainViews(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: saveView.topAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        //picker.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        picker.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        picker.bottomAnchor.constraint(equalTo: saveView.topAnchor, constant: 0).isActive = true
        picker.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        picker.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        priceView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        priceView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        priceView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.65).isActive = true
        
        rulesView.translatesAutoresizingMaskIntoConstraints = false
        rulesView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        rulesView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        rulesView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        rulesView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        descriptionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        boatModelView.translatesAutoresizingMaskIntoConstraints = false
        boatModelView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        boatModelView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        boatModelView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        boatModelView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        saveView.translatesAutoresizingMaskIntoConstraints = false
        saveView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        saveView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        saveView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        saveView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.15).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: bgImageView.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: bgImageView.leftAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalTo: bgImageView.heightAnchor, multiplier: 0.1).isActive = true
        backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor, multiplier: 1).isActive = true
        
        self.view.setNeedsLayout()
        self.view.setNeedsDisplay()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        bgImageView.setup()
    }
    
    func setup(){
        
        self.view.backgroundColor = THEME_1
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.register(NewBoatTableViewCell.self, forCellReuseIdentifier: "newboat")
        tableView.delegate = self
        tableView.dataSource = self
        bgImageView.isHidden = false
        bgImageView.controller = self
        priceView.isHidden = true
        rulesView.isHidden = true
        descriptionView.isHidden = true
        descriptionView.doneButton.setTitle("Save Description", for: .normal)
        boatModelView.isHidden = true
        boatModelView.doneButton.setTitle("Save Model", for: .normal)
        //tableView.frame = self.view.frame
        
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        picker.backgroundColor = THEME_2
        
        self.view.addSubview(tableView)
        self.view.addSubview(picker)
        self.view.addSubview(priceView)
        self.view.addSubview(rulesView)
        self.view.addSubview(descriptionView)
        self.view.addSubview(saveView)
        self.view.addSubview(boatModelView)
        bgImageView.addSubview(backButton)
        
        addImageIcon.icon.image = UIImage(named: "photo")
        addImageIcon.label.text = "Add Image"
        addImageIcon.label.font = RobotoFont.bold(with: largeFontWidth)
        
        priceView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setPrice), for: .touchUpInside)
        rulesView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setRules), for: .touchUpInside)
        boatModelView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setModel), for: .touchUpInside)
        descriptionView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setDescription), for: .touchUpInside)
        
        saveView.saveBtn.backgroundColor = Color.grey.lighten2
        saveView.saveBtn.isUserInteractionEnabled = false
        saveView.saveBtn.addTarget(self, action: #selector(NewBoatViewController.saveBoat), for: .touchUpInside)
        
        backButton.image = UIImage(named: "back")
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(NewBoatViewController.back), for: .touchUpInside)
        
        imagePicker.delegate = self
    }
    
    func back(){
        
        let controller = SetBoatLocationViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func donePicker(){
        
        picker.isHidden = true
    }
    
    func cancelPicker() {
        
        picker.isHidden = true
    }
    
    func setModel(){
        
        saveView.isHidden = false
        boatModelView.isHidden = true
        tableView.isUserInteractionEnabled = true
        
        guard boatModelView.textBox.text != "" else {
            
            return
        }
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        boat.boatModel = boatModelView.textBox.text
        
        tableView.reloadData()
        
        guard completedRows.count == 13 else {
            
            return
        }
        
        guard priceView.textfield.text != "" else {
            
            return
        }
        
        guard rulesView.textBox.text != "" else {
            
            return
        }
        
        guard boatModelView.textBox.text != "" else {
            
            return
        }
      
        saveView.saveBtn.backgroundColor = THEME_1
        saveView.saveBtn.isUserInteractionEnabled = true
        
    }
    
    func setRules(){
        
        saveView.isHidden = false
        rulesView.isHidden = true
        tableView.isUserInteractionEnabled = true
        
        guard rulesView.textBox.text != "" else {
            
            return
        }
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        boat.boatRules = rulesView.textBox.text
        
        tableView.reloadData()
        
        guard completedRows.count == 13 else {
            
            return
        }
        
        guard priceView.textfield.text != "" else {
            
            return
        }
        
        guard rulesView.textBox.text != "" else {
            
            return
        }
        
        guard boatModelView.textBox.text != "" else {
            
            return
        }
        
        saveView.saveBtn.backgroundColor = THEME_1
        saveView.saveBtn.isUserInteractionEnabled = true
        
    }
    
    func setDescription(){
        
        saveView.isHidden = false
        descriptionView.isHidden = true
        tableView.isUserInteractionEnabled = true
        
        guard descriptionView.textBox.text != "" else {
            
            return
        }
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        boat.description = descriptionView.textBox.text
        
        tableView.reloadData()
        
        guard completedRows.count == 13 else {
            
            return
        }
        
        guard priceView.textfield.text != "" else {
            
            return
        }
        
        guard rulesView.textBox.text != "" else {
            
            return
        }
        
        guard boatModelView.textBox.text != "" else {
            
            return
        }
        
        saveView.saveBtn.backgroundColor = THEME_1
        saveView.saveBtn.isUserInteractionEnabled = true
        
    }
    
    func setPrice(){
        
        priceView.isHidden = true
        saveView.isHidden = false
        priceView.textfield.resignFirstResponder()
        tableView.isUserInteractionEnabled = true
        tableView.isScrollEnabled = true
        
        guard priceView.textfield.text != "" else {
            
            return
        }
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        
        
        let number = Int(priceView.textfield.text!)
        boat.price = number
        let finalNumber = NumberFormatter.localizedString(from: NSNumber(value: number!), number: NumberFormatter.Style.currency)
        
        optionArray.remove(at: currentIndex)
        optionArray.insert("\(finalNumber)/Hour", at: currentIndex)
        priceView.textfield.text = ""
        
        tableView.reloadData()
        
        guard completedRows.count == 13 else {
            
            return
        }
        
        guard priceView.textfield.text != "" else {
            
            return
        }
        
        guard rulesView.textBox.text != "" else {
            
            return
        }
        
        guard boatModelView.textBox.text != "" else {
            
            return
        }
        
        saveView.saveBtn.backgroundColor = THEME_1
        saveView.saveBtn.isUserInteractionEnabled = true
        
        print("completed \(completedRows.count)")
    }
    
    func saveBoat(){
        
        let alert = CDAlertView(title: "Boat Saved Successfully", message: "", type: .notification)
        var doneAction:CDAlertViewAction!
        doneAction = CDAlertViewAction(title: "OK 😑",  handler: { (action) in

            let controller = ExploreViewController()
            controller.tapText2()
            self.navigationController?.pushViewController(controller, animated: true)
            
        })
        alert.add(action: doneAction)
        
        guard bgImageView.images.count > 0 else {
            
            print("Alert the user to upload at least 1 image")
            
            return
        
        }
        
        boat.userId = "5E43B945-ACBA-4398-81E3-F3177C30F546"
        boat.lat = DataStore().getLat()
        boat.long = DataStore().getLong()
        boat.location = DataStore().getLocation()
        boat.title = DataStore().getTitle()
        boat.tripType = DataStore().getNewType()
        
        print(boat.lat)
        print(boat.long)
        print(boat.location)
        print(boat.title)
        print(boat.size)
        
        startAnimating(self.view.frame.size, message: "Logging In", messageFont: RobotoFont.bold(with: largeFontWidth), type: .ballScale , color: THEME_1, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: Color.black.withAlphaComponent(0.6))
        
        NewBoatPrensenter().saveBoat(boat: self.boat, images: self.bgImageView.images) {
            
            self.stopAnimating()
            alert.show()
            
            print("alert the user that the boat as been saved")
        }
        
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
