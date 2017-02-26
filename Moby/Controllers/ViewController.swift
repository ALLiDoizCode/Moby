//
//  ViewController.swift
//  Moby
//
//  Created by Jonathan on 10/26/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cartography
import Animo

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableview = UITableView()
    var goFishBtn = FlatButton()
    var locationBtn = FlatButton()
    var tripBtn = FlatButton()
    var timeBtn = FlatButton()
    var profileBtn = FlatButton()
    var giftBtn = FlatButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.flatTeal()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        setupFish(view: self.view) { (fishes) in
            
            let yRange = Int(self.view.frame.height)
            
            for fish in fishes {
                
                let startRange = [-100, -80, -60, -115, -125]
                let time = Int(arc4random_uniform(5) + 10)
                let startY = Int(arc4random_uniform(UInt32(yRange)) + 10)
                let endY = Int(arc4random_uniform(UInt32(yRange)) + 10)
                let ran = Int(arc4random_uniform(4))
                
                let endPoint = CGPoint(x: 600, y: endY)
                let startPoint = CGPoint(x: startRange[ran], y: startY)
                
                print("fish")
                
                fish.layer.runAnimation(Animo.group(
                    Animo.wait(TimeInterval(ran)),
                    Animo.replayForever(
                        Animo.sequence(
                            Animo.move(from: startPoint, to: endPoint, duration: TimeInterval(time)),
                            timingMode: .linear,
                            options: Options(speed: 1, fillMode: Options.FillMode.both, removedOnCompletion: true)
                        )
                    )
                    ), completion: {
                        
                        
                })
                
                /*fish.layer.runAnimation(
                 
                 )*/
            }
            
            self.buildView()
        }
        
        
        /*tableview.backgroundColor = UIColor.white
        
        tableview.frame = self.view.frame
        
        self.view.addSubview(tableview)
        
        tableview.register(CaptinCell.self, forCellReuseIdentifier: captinCellID)
        
        tableview.dataSource = self
        tableview.delegate = self*/
        
        
    }
    
    func buildView() {
        
        self.view.addSubview(goFishBtn)
        self.view.addSubview(locationBtn)
        self.view.addSubview(tripBtn)
        self.view.addSubview(timeBtn)
        self.view.addSubview(profileBtn)
        self.view.addSubview(giftBtn)
        
        goFishBtn.setTitle("Set Trip", for: .normal)
        goFishBtn.backgroundColor = UIColor(complementaryFlatColorOf: self.view.backgroundColor)
        
        locationBtn.setTitle("             1 Infinite Loop", for: .normal)
        locationBtn.contentHorizontalAlignment = .left
        locationBtn.setTitleColor(UIColor.darkText, for: .normal)
        locationBtn.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        
        let tripImage = UIImage(named: "fishing")
        tripBtn.shapePreset = .circle
        tripBtn.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        tripBtn.borderColor = self.view.backgroundColor
        tripBtn.borderWidthPreset = .border5
        tripBtn.setImage(tripImage, for: .normal)
        tripBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        let timeImage = UIImage(named: "clock")
        timeBtn.shapePreset = .circle
        timeBtn.backgroundColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:1.0)
        timeBtn.borderColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:1.0)
        timeBtn.borderWidthPreset = .border3
        timeBtn.setImage(timeImage, for: .normal)
        
        let userImage = UIImage(named: "user")
        profileBtn.shapePreset = .circle
        //timeBtn.backgroundColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:1.0)
        profileBtn.borderColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        profileBtn.borderWidthPreset = .border4
        profileBtn.setImage(userImage, for: .normal)
        
        let giftImage = UIImage(named: "gift")
        giftBtn.shapePreset = .circle
        giftBtn.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        //giftBtn.borderColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        //giftBtn.borderWidthPreset = .border4
        giftBtn.setImage(giftImage, for: .normal)
        giftBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        
        let views:[UIView] = [goFishBtn,locationBtn,tripBtn,timeBtn,profileBtn,giftBtn]
        
        constrain(views) { (_views) in
            
            let superView = _views[0].superview
            let left = _views[0].superview?.left
            let right = _views[0].superview?.right
            let top = _views[0].superview?.top
            let bottom = _views[0].superview?.bottom
            
            _views[0].left == (left)! + 10
            _views[0].right == (right)! - 10
            _views[0].bottom == (bottom)! - 10
            _views[0].height == 60
            
            _views[1].left == _views[2].centerX
            _views[1].right == (right)! - 10
            _views[1].bottom == _views[0].top - 10
            _views[1].height == 60
            
            _views[2].left == (left)! + 5
            //_views[2].right == (right)! - 10
            _views[2].bottom == _views[1].bottom
            _views[2].height == 65
            _views[2].width == 65
            
            //_views[2].left == (left)! + 5
            _views[3].right == (right)! - 20
            _views[3].centerY == _views[1].centerY
            _views[3].height == 35
            _views[3].width == 35
            
            _views[4].left == (left)! + 10
            _views[4].top == (top)! + 10
            _views[4].height == 50
            _views[4].width == 50
            
            _views[5].right == (right)! - 10
            _views[5].top == (top)! + 10
            _views[5].height == 50
            _views[5].width == 50
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CaptinCell? = tableview.dequeueReusableCell(withIdentifier: captinCellID, for: indexPath) as? CaptinCell
        
        return cell!
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

