//
//  MainViewController.swift
//  Moby
//
//  Created by Jonathan on 1/25/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cartography
import Animo
import SwiftEventBus
import SendBirdSDK

class MainViewController: UIViewController, SBDChannelDelegate {
    
    var fishingBtn = FlatButton()
    var cruiseBtn = FlatButton()
    var logo = UILabel()
    var instructions = UILabel()
    var profile = FlatButton()
    
    var views:[UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        joinChannel()
        
        //SBDMain.add(self as SBDChannelDelegate, identifier: ParseClient().currentUserName!)
        
        //SwiftEventBus.post("live")
        
        self.view.backgroundColor = UIColor(red:0.43, green:0.84, blue:0.85, alpha:1.0)
        
        self.navigationController?.isNavigationBarHidden = true
        
        setUp()
        
        boatAnimo()
        
        // Do any additional setup after loading the view.
    }
    
    func joinChannel(){
        
        Location().getAdress { (address) in
            
            let city = address["City"] as! String
            let state = address["State"] as! String
            
            print("address is \(city) \(state)")
        }
    }
    
    func boatAnimo(){
        
        let boat = UIImageView(frame: CGRect(x: -50, y: 50, width: 50, height: 50))
        self.view.addSubview(boat)
        
        let image = UIImage(named: "cruise")
        boat.image = image
        boat.contentMode = .scaleAspectFill
        
        let start = CGPoint(x: -50, y: 50)
        let end = CGPoint(x:400, y: 50)
        
        boat.layer.runAnimation(Animo.group(
            Animo.wait(0),
            Animo.replayForever(
                Animo.sequence(
                    Animo.move(from: start, to: end, duration: TimeInterval(7)),
                    timingMode: .linear,
                    options: Options(speed: 1, fillMode: Options.FillMode.both, removedOnCompletion: true)
                )
            )
            ), completion: {
                
                
        })
    }
    
    func setUp() {
        
        self.view.addSubview(fishingBtn)
        self.view.addSubview(cruiseBtn)
        self.view.addSubview(logo)
        self.view.addSubview(instructions)
        self.view.addSubview(profile)
        
        views.append(logo)
        views.append(fishingBtn)
        views.append(cruiseBtn)
        views.append(instructions)
        
        
        instructions.text = "What Kind Of Boat Are You Looking For"
        instructions.textAlignment = .center
        instructions.numberOfLines = 0
        instructions.font = RobotoFont.bold(with: 32)
        instructions.textColor = UIColor(red:0.20, green:0.26, blue:0.37, alpha:1.0)
        
        let fishImage = UIImage(named: "fishing")
        let fishingImageView = UIImageView()
        fishingImageView.image = fishImage
        fishingImageView.clipsToBounds = true
        fishingImageView.contentMode = .scaleAspectFit
        fishingBtn.addSubview(fishingImageView)
        fishingBtn.backgroundColor = UIColor(red:0.20, green:0.26, blue:0.37, alpha:1.0)
        fishingBtn.shapePreset = .circle
        views.append(fishingImageView)
        
        let cruiseImage = UIImage(named: "cruise")
        let cruiseImageView = UIImageView()
        cruiseImageView.image = cruiseImage
        cruiseImageView.clipsToBounds = true
        cruiseImageView.contentMode = .scaleAspectFit
        cruiseBtn.addSubview(cruiseImageView)
        cruiseBtn.backgroundColor = UIColor(red:0.20, green:0.26, blue:0.37, alpha:1.0)
        cruiseBtn.shapePreset = .circle
        views.append(cruiseImageView)
        
        let profileImage = UIImage(named: "user")
        let profileImageView = UIImageView()
        profileImageView.image = profileImage
        profileImageView.clipsToBounds = true
        profileImageView.contentMode = .scaleAspectFit
        profile.addSubview(profileImageView)
        profile.backgroundColor = UIColor.clear
        profile.shapePreset = .circle
        views.append(profile)
        views.append(profileImageView)
        
        constrain(views) { (_views) in
            
            let parentView = _views[0].superview
            
            _views[0].top == (parentView?.top)! + 50
            _views[0].left == (parentView?.left)! + 100
            _views[0].right == (parentView?.right)! - 100
            
            _views[1].top == _views[0].bottom + 100
            _views[1].right == (parentView?.centerX)! - 20
            _views[1].width == 100
            _views[1].height == 100
            
            _views[2].top == _views[0].bottom + 100
            _views[2].left == (parentView?.centerX)! + 20
            _views[2].width == 100
            _views[2].height == 100
            
            _views[3].top == _views[2].bottom + 50
            _views[3].right == (parentView?.right)! - 50
            _views[3].left == (parentView?.left)! + 50
            
            //_views[4].top == (_views[4].superview?.top)!
            _views[4].center == (_views[4].superview?.center)!
            _views[4].size == (_views[4].superview?.size)! / 1.3
            
            //_views[5].top == (_views[5].superview?.top)!
            _views[5].center == (_views[5].superview?.center)!
            _views[5].size == (_views[5].superview?.size)! / 1.3
            
            /*_views[6].top == (parentView?.top)! + 20
            _views[6].left == (parentView?.left)! + 20
            _views[6].width == 30
            _views[6].height == 30
            
            //_views[5].top == (_views[5].superview?.top)!
            _views[7].center == (_views[7].superview?.center)!
            _views[7].size == (_views[7].superview?.size)!*/
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    func sendMsg(){
        
        //RealTime().sendMessage(channel: <#T##SBDOpenChannel#>, myMessage: "Hello Mo-B")
    }
    
    
    func channel(_ sender: SBDBaseChannel, didReceive message: SBDBaseMessage) {
        
        print("message is \(message._IQDescription())")
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
