//
//  NewBoatViewController.swift
//  Moby
//
//  Created by Jonathan on 4/6/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class NewBoatViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    
    var tableView:UITableView!
    var headerView = UIView()
    var bgImageView = UIImageView()
    var addImageIcon = IconView()
    var picker = UIPickerView()
    var currentList:[String] = []
    var currentIndex:Int!
    var priceView = PriceView()
    var rulesView = RulesView()
 
    var optionArray:[String] = ["Make","Year Built","Boat Model","Boat Type","Boat Rules","Passengers","Size","Price","Min Time"]
    
    var minHours:[String] = ["None","1","2","3","4"]
    
    var passengers:[String] = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]
    
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
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        //picker.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        picker.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        picker.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        picker.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        picker.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        bgImageView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 0).isActive = true
        bgImageView.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: 0).isActive = true
        
        addImageIcon.translatesAutoresizingMaskIntoConstraints = false
        addImageIcon.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        addImageIcon.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        addImageIcon.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 1).isActive = true
        addImageIcon.widthAnchor.constraint(equalTo: addImageIcon.heightAnchor, multiplier: 1).isActive = true
        
        
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        priceView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        priceView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        priceView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.65).isActive = true
        
        rulesView.translatesAutoresizingMaskIntoConstraints = false
        rulesView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        rulesView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        rulesView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        rulesView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setup(){
        
        self.view.backgroundColor = THEME_2
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.register(NewBoatTableViewCell.self, forCellReuseIdentifier: "newboat")
        tableView.delegate = self
        tableView.dataSource = self
        bgImageView.isHidden = true
        priceView.isHidden = true
        rulesView.isHidden = true
        //tableView.frame = self.view.frame
        
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        picker.backgroundColor = THEME_2
        
        self.view.addSubview(tableView)
        self.view.addSubview(picker)
        self.view.addSubview(priceView)
        self.view.addSubview(rulesView)
        headerView.addSubview(bgImageView)
        headerView.addSubview(addImageIcon)
        
        addImageIcon.icon.image = UIImage(named: "photo")
        addImageIcon.label.text = "Add Image"
        addImageIcon.label.font = RobotoFont.bold(with: largeFontWidth)
        
        let boatImage = UIImage(named: "boat_4")
        bgImageView.image = boatImage
        bgImageView.contentMode = .scaleAspectFit
        
        priceView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setPrice), for: .touchUpInside)
        rulesView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setRules), for: .touchUpInside)
    }
    
    func donePicker(){
        
        picker.isHidden = true
    }
    
    func cancelPicker() {
        
        picker.isHidden = true
    }
    
    func setRules(){
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        
        rulesView.isHidden = true
        tableView.isUserInteractionEnabled = true
        tableView.reloadData()
        
    }
    
    func setPrice(){
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        
        let number = Int(priceView.textfield.text!)
       
        let finalNumber = NumberFormatter.localizedString(from: NSNumber(value: number!), number: NumberFormatter.Style.currency)
        
        optionArray.remove(at: currentIndex)
        optionArray.insert("\(finalNumber)/Hour", at: currentIndex)
        priceView.textfield.text = ""
        priceView.isHidden = true
        priceView.textfield.resignFirstResponder()
        tableView.isUserInteractionEnabled = true
        tableView.isScrollEnabled = true
        tableView.reloadData()
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
