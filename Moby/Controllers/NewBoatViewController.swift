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
    var bgImageView = PictureViews()
    var addImageIcon = IconView()
    var picker = UIPickerView()
    var currentList:[String] = []
    var currentIndex:Int!
    var priceView = PriceView()
    var rulesView = RulesView()
    var boatModelView = RulesView()
    var saveView = SaveView()
    var backButton = FlatButton()
 
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
        backButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.03).isActive = true
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
        priceView.isHidden = true
        rulesView.isHidden = true
        boatModelView.isHidden = true
        boatModelView.doneButton.setTitle("Set Model", for: .normal)
        //tableView.frame = self.view.frame
        
        picker.delegate = self
        picker.dataSource = self
        picker.isHidden = true
        picker.backgroundColor = THEME_2
        
        self.view.addSubview(tableView)
        self.view.addSubview(picker)
        self.view.addSubview(priceView)
        self.view.addSubview(rulesView)
        self.view.addSubview(saveView)
        self.view.addSubview(boatModelView)
        self.view.addSubview(backButton)
        
        addImageIcon.icon.image = UIImage(named: "photo")
        addImageIcon.label.text = "Add Image"
        addImageIcon.label.font = RobotoFont.bold(with: largeFontWidth)
        
        priceView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setPrice), for: .touchUpInside)
        rulesView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setRules), for: .touchUpInside)
        boatModelView.doneButton.addTarget(self, action: #selector(NewBoatViewController.setModel), for: .touchUpInside)
        
        saveView.saveBtn.backgroundColor = Color.grey.lighten2
        saveView.saveBtn.isUserInteractionEnabled = false
        
        backButton.image = UIImage(named: "back")
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(NewBoatViewController.back), for: .touchUpInside)
    }
    
    func back(){
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func donePicker(){
        
        picker.isHidden = true
    }
    
    func cancelPicker() {
        
        picker.isHidden = true
    }
    
    func setModel(){
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        
        saveView.isHidden = false
        boatModelView.isHidden = true
        tableView.isUserInteractionEnabled = true
        tableView.reloadData()
        
    }
    
    func setRules(){
        
        if completedRows.contains(currentIndex) == false {
            
            completedRows.append(currentIndex)
            
            print("added row \(currentIndex)")
        }
        
        saveView.isHidden = false
        rulesView.isHidden = true
        tableView.isUserInteractionEnabled = true
        tableView.reloadData()
        
    }
    
    func setPrice(){
        
        guard priceView.textfield.text != "" else {
            
            return
        }
        
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
        saveView.isHidden = false
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
