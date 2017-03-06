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
import NVActivityIndicatorView

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableview = UITableView()
    var goFishBtn = FlatButton()
    var locationBtn = FlatButton()
    var tripBtn = FlatButton()
    var timeBtn = FlatButton()
    var profileBtn = FlatButton()
    var giftBtn = FlatButton()
    var estimateView = UIView()
    var amountLabel = UILabel()
    var durationLabel = UILabel()
    var cardLabel = UILabel()
    var amount = UILabel()
    var duration = UILabel()
    var card = UILabel()
    var greyView = UIView()
    var serperator = UIView()
    var typeImage = UIImageView()
    var editBtn = FlatButton()
    var loader = NVActivityIndicatorView(frame: .zero)
    var loadingLbl = UILabel()
    
    //CAPTAIN INFO VARs
    
    var captainView = UIView()
    var captainLbl = UILabel()
    var captainnView = View()
    var captainNameLbl = UILabel()
    var locationLbl = UILabel()
    var locationNameLbl = UILabel()
    var boatImage = UIImageView()
    var boat2Image = UIImage(named: "boat2")
    var boatModelLbl = UILabel()
    var departureLbl = UILabel()
    var timeLbl = UILabel()
    
    
    
    
    
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
            self.buildEstimate()
            self.captainViews()
        }
        
        
        /*tableview.backgroundColor = UIColor.white
        
        tableview.frame = self.view.frame
        
        self.view.addSubview(tableview)
        
        tableview.register(CaptinCell.self, forCellReuseIdentifier: captinCellID)
        
        tableview.dataSource = self
        tableview.delegate = self*/
        
        
    }
    
    func buildEstimate(){
        
        estimateView.addSubview(greyView)
        estimateView.addSubview(serperator)
        estimateView.addSubview(amountLabel)
        estimateView.addSubview(durationLabel)
        estimateView.addSubview(cardLabel)
        estimateView.addSubview(amount)
        estimateView.addSubview(duration)
        estimateView.addSubview(card)
        
        amountLabel.numberOfLines = 0
        amountLabel.textAlignment = .center
        amountLabel.text = "Total"
        amount.textColor = Color.grey.darken1
        
        durationLabel.numberOfLines = 0
        durationLabel.textAlignment = .center
        durationLabel.text = "Duration"
        durationLabel.textColor = Color.grey.darken1
        
        cardLabel.numberOfLines = 0
        cardLabel.textAlignment = .center
        cardLabel.text = "Payment"
        cardLabel.textColor = Color.grey.darken1
        
        amount.numberOfLines = 0
        amount.textAlignment = .center
        amount.text = "$50.35"
        
        duration.numberOfLines = 0
        duration.textAlignment = .center
        duration.text = "3hrs"
        
        card.numberOfLines = 0
        card.textAlignment = .center
        card.text = "*1111"
        
        greyView.backgroundColor = Color.grey.lighten3
        serperator.backgroundColor = Color.grey.lighten1
        
        let views:[UIView] = [amountLabel,durationLabel,cardLabel,amount,duration,card,greyView,serperator]
        
        constrain(views) { (_views) in
            
            let superView = _views[0].superview
            let left = _views[0].superview?.left
            let right = _views[0].superview?.right
            let top = _views[0].superview?.top
            let bottom = _views[0].superview?.bottom
            
            _views[0].centerX == (superView?.centerX)!
            _views[0].top == (top)! + 10
            _views[0].width == (superView?.width)!
            
            _views[3].centerX == (superView?.centerX)!
            _views[3].top == _views[0].bottom
            _views[3].width == (superView?.width)!
            
            _views[1].right == (right)!
            _views[1].left == (superView?.centerX)! + 50
            _views[1].bottom == (superView?.centerY)! + 10
            
            _views[4].right == (right)!
            _views[4].left == (superView?.centerX)! + 50
            _views[4].bottom ==  _views[1].top
            
            _views[2].left == (left)!
            _views[2].right == (superView?.centerX)! - 50
            _views[2].bottom == (superView?.centerY)! + 10
            
            _views[5].left == (left)!
            _views[5].right == (superView?.centerX)! - 50
            _views[5].bottom ==  _views[2].top
            
            _views[6].left == (left)!
            _views[6].right == (right)!
            _views[6].top == (top)!
            _views[6].bottom == _views[1].bottom + 5
            
            _views[7].left == (left)!
            _views[7].right == (right)!
            _views[7].height == 2.5
            _views[7].bottom == _views[1].bottom + 5

        }
    }
    func goFish(){
        
        guard loader.isAnimating != true else {
            
            loader.stopAnimating()
            loadingLbl.isHidden = true
            goFishBtn.setTitle("Go Fish", for: .normal)
            editBtn.isHidden = false
            locationBtn.isUserInteractionEnabled = true
            tripBtn.isUserInteractionEnabled = true
            timeBtn.isUserInteractionEnabled = true
            profileBtn.isUserInteractionEnabled = true
            giftBtn.isUserInteractionEnabled = true
            
            return
        }
        
        loader.startAnimating()
        loadingLbl.isHidden = false
        goFishBtn.setTitle("Cancle", for: .normal)
        editBtn.isHidden = true
        locationBtn.isUserInteractionEnabled = false
        tripBtn.isUserInteractionEnabled = false
        timeBtn.isUserInteractionEnabled = false
        profileBtn.isUserInteractionEnabled = false
        giftBtn.isUserInteractionEnabled = false
        
    }
    
    func edit(){
        
        estimateView.isHidden = true
        typeImage.isHidden = true
        tripBtn.isHidden = false
        editBtn.isHidden = true
        goFishBtn.setTitle("Set Location", for: .normal)
        goFishBtn.backgroundColor = UIColor(complementaryFlatColorOf: self.view.backgroundColor)
        goFishBtn.removeTarget(self, action: #selector(ViewController.goFish), for: .touchUpInside)
        goFishBtn.addTarget(self, action: #selector(ViewController.getEst), for: .touchUpInside)
    }
    
    func getEst(){
        
        guard estimateView.isHidden == true else {
            
            return
        }
        
        estimateView.isHidden = false
        typeImage.isHidden = false
        tripBtn.isHidden = true
        editBtn.isHidden = false
        goFishBtn.setTitle("Go Fish", for: .normal)
        goFishBtn.backgroundColor = UIColor.flatTeal().lighten(byPercentage: 15)
        goFishBtn.removeTarget(self, action: #selector(ViewController.getEst), for: .touchUpInside)
        goFishBtn.addTarget(self, action: #selector(ViewController.goFish), for: .touchUpInside)
        
    }
    
    func buildView() {
        
        self.view.addSubview(estimateView)
        self.view.addSubview(goFishBtn)
        self.view.addSubview(editBtn)
        self.view.addSubview(locationBtn)
        self.view.addSubview(tripBtn)
        self.view.addSubview(timeBtn)
        self.view.addSubview(profileBtn)
        self.view.addSubview(giftBtn)
        self.view.addSubview(typeImage)
        self.view.addSubview(loader)
        self.view.addSubview(loadingLbl)
        
        
        estimateView.backgroundColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        estimateView.cornerRadius = 3
        estimateView.isHidden = true
        
        goFishBtn.setTitle("Set Location", for: .normal)
        goFishBtn.backgroundColor = UIColor(complementaryFlatColorOf: self.view.backgroundColor)
        goFishBtn.addTarget(self, action: #selector(ViewController.getEst), for: .touchUpInside)
        
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
        giftBtn.backgroundColor = UIColor.flatTeal().lighten(byPercentage: 15)
        //giftBtn.borderColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        //giftBtn.borderWidthPreset = .border4
        giftBtn.setImage(giftImage, for: .normal)
        giftBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        
        typeImage.image = tripImage
        typeImage.contentMode = .scaleAspectFit
        typeImage.isHidden = true
        
        let editImage = UIImage(named: "edit")
        editBtn.shapePreset = .circle
        //timeBtn.backgroundColor = UIColor(red:0.83, green:0.83, blue:0.83, alpha:1.0)
        editBtn.borderColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        //editBtn.borderWidthPreset = .border4
        editBtn.setImage(editImage, for: .normal)
        editBtn.addTarget(self, action: #selector(ViewController.edit), for: .touchUpInside)
        editBtn.isHidden = true
        
        
        loader.type = .ballScale
        loader.color = UIColor.flatTeal().lighten(byPercentage: 15)
        
        loadingLbl.text = "Finding Captin"
        loadingLbl.font = RobotoFont.bold(with: 24)
        loadingLbl.textAlignment = .center
        loadingLbl.textColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        loadingLbl.isHidden = true
        
        
        
        
        let views:[UIView] = [goFishBtn,locationBtn,tripBtn,timeBtn,profileBtn,giftBtn,estimateView,typeImage,editBtn,loader,loadingLbl]
        
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
            
            _views[6].left == (left)! + 10
            _views[6].right == (right)! - 10
            _views[6].bottom == _views[1].bottom
            _views[6].height == _views[1].height * 3
            
            _views[7].left == (left)! + 30
            //_views[2].right == (right)! - 10
            _views[7].centerY == _views[1].centerY - 10
            _views[7].height == 40
            _views[7].width == 40
            
            _views[8].left == (left)! + 10
            _views[8].bottom ==  _views[6].top - 10
            _views[8].height == 50
            _views[8].width == 50
            
            //_views[9].left == (left)! + 50
            _views[9].bottom == _views[6].top - 10
            _views[9].height == 300
            _views[9].width == 300
            _views[9].centerX == (superView?.centerX)!
            
            //_views[9].left == (left)! + 50
            _views[10].bottom == _views[9].top - 5
            //_views[10].height == 300
            _views[10].width == _views[9].width
            _views[10].centerX == (superView?.centerX)!
            
            
            
    
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
    
    func captainViews(){
        
        //Captain Info Views
        self.view.addSubview(captainView)
        self.captainView.addSubview(captainLbl)
        self.captainView.addSubview(captainnView)
        self.captainView.addSubview(captainNameLbl)
        self.captainView.addSubview(locationLbl)
        self.captainView.addSubview(locationNameLbl)
        self.captainView.addSubview(boatImage)
        self.captainView.addSubview(boatModelLbl)
        self.captainView.addSubview(departureLbl)
        self.captainView.addSubview(timeLbl)
        
        // Captain Info View build
        
        captainView.backgroundColor = UIColor.flatWhite()
        captainnView.cornerRadius = 3
        
        captainLbl.text = "Hook"
        captainLbl.font = RobotoFont.bold(with: 26)
        captainLbl.textColor = UIColor.flatBlack()
        //captainLbl.backgroundColor = UIColor.flatPink()
        captainLbl.textAlignment = .center
        
        
        let theImage = UIImage(named: "joe")
        
        captainnView.shapePreset = .circle
        captainnView.image = theImage
        
        locationLbl.text = "Location"
        locationLbl.font = RobotoFont.bold(with: 20)
        locationLbl.textColor = UIColor.flatBlack()
        locationLbl.textAlignment = .center
        //locationLbl.backgroundColor = UIColor.flatPink()
        
        locationNameLbl.textAlignment = .left
        locationNameLbl.font = RobotoFont.bold(with: 24)
        //locationNameLbl.textColor
        
        boatImage.image = UIImage(named: "boat2")
        
        
        boatModelLbl.textAlignment = .left
        boatModelLbl.textColor = UIColor.flatBlack()
        boatModelLbl.text = "Fountain 38 Express Cruiser"
        boatModelLbl.font = RobotoFont.bold(with: 16)
        //boatModelLbl.backgroundColor = UIColor.flatPink()
        
        //departureLbl.backgroundColor = UIColor.flatPink()
        departureLbl.text = "Departure"
        departureLbl.font = RobotoFont.bold(with:20)
        departureLbl.textColor = UIColor.flatBlack()
        departureLbl.textAlignment = .center
        
        //timeLbl.backgroundColor = UIColor.flatPink()
        timeLbl.text = "10:00AM"
        timeLbl.font = RobotoFont.bold(with:24)
        timeLbl.textColor = UIColor.flatBlack()
        timeLbl.textAlignment = .center
        
        //captainView.isHidden = true
        
        let views:[UIView] = [captainView,captainLbl,captainnView,locationLbl,boatImage,boatModelLbl,departureLbl,timeLbl]
        
        constrain(views) { (_views) in
            
            let superView = _views[0].superview
            
        
            _views[0].centerX == (superView?.centerX)!
            _views[0].top == (superView?.top)! + 100
            _views[0].left == (superView?.left)! + 10
            _views[0].right == (superView?.right)! - 10
            _views[0].bottom == (superView?.bottom)! - 150
            
            
            //_views[1].centerX == (_views[0].centerX)
            _views[1].left == (_views[4].right) + 5
            _views[1].top == (_views[0].top) + 5
            _views[1].height == 25
            _views[1].width == 100
            
            //_views[2].centerX == (_views[0].centerX)
            _views[2].left == (_views[4].right) + 5
            _views[2].right == (_views[0].right) - 5
            
            _views[2].top == (_views[1].bottom) + 5
            _views[2].height == 80
            _views[2].width == 80
            
            _views[3].top == (_views[5].bottom) + 25
            _views[3].left == (_views[0].left) + 10
            _views[3].height == 25
            //_views[3].centerX == (superView?.centerX)!
            _views[3].width == 110
            
            _views[4].top == (_views[0].top) + 0
            _views[4].left == (_views[0].left) + 0
            _views[4].bottom == (_views[0].bottom) - 150
            _views[4].right == (_views[0].right) - 110
            //_views[4].height == 70
            //_views[4].width == 70
            //_views[4].centerX == (superView?.centerX)!
            
            _views[5].top == (_views[4].bottom) + 2
            _views[5].height == 15
            _views[5].width == 250
            _views[5].left == (_views[0].left) + 3
            
            //_views[6].centerX == (superView?.centerX)!
            _views[6].top == (_views[5].bottom) + 25
            _views[6].height == 25
            _views[6].width == 250
            _views[6].right == (_views[0].right) - 10
            
            _views[7].centerX == (_views[6].centerX)
            _views[7].top == (_views[6].bottom) + 5
            _views[7].height == 25
            _views[7].width == 110
            _views[7].right == (_views[0].right) - 10
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

