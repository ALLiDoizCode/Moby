//
//  LoginViewController.swift
//  Moby
//
//  Created by Jonathan on 2/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cartography
import SwiftEventBus
import ChameleonFramework
import Animo

class LoginViewController: UIViewController {
    
    var bgView = ImageCard()
    var email = TextField()
    var firstName = TextField()
    var lastName = TextField()
    var password = TextField()
    var contentView = UIView()
    var login = FlatButton()
    var back = FlatButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Client().newUser()
        
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
            
            self.buildViews()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buildViews(){
        
        self.view.backgroundColor = UIColor.flatTeal()
        
        self.view.addSubview(bgView)
        self.view.addSubview(contentView)
        self.view.addSubview(back)
        self.contentView.addSubview(email)
        self.contentView.addSubview(firstName)
        self.contentView.addSubview(lastName)
        self.contentView.addSubview(password)
        self.contentView.addSubview(login)
        
        let views:[UIView] = [bgView,contentView,email,password,login,back]
        
        constrain(views) { (_Views) in
            
            let superView = _Views[0].superview
            
            _Views[0].center == (superView?.center)!
            _Views[0].left == (superView?.left)! + 20
            _Views[0].right == (superView?.right)! - 20
            _Views[0].height == 250
            
            //_Views[1].top == (superView?.bottom)!
            //_Views[1].centerX == (superView?.centerX)!
            //_Views[1].left == (superView?.left)!
            //_Views[1].right == (superView?.right)!
            //_Views[1].top == _Views[2].top - 10
            _Views[1].bottom == _Views[4].bottom + 10
            
            _Views[2].top == (_Views[1].top) + 30
            _Views[2].left == (_Views[1].left) + 20
            _Views[2].width == _Views[0].width - 40
            //_Views[2].right == _Views[0].width
            
            _Views[3].top == _Views[2].bottom + 30
            _Views[3].left == (_Views[1].left) + 20
            _Views[3].width == _Views[0].width - 40
            //_Views[3].right == (_Views[0].right) - 20
            
            _Views[4].top == _Views[3].bottom + 30
            _Views[4].left == (_Views[1].left) + 20
            _Views[4].width == _Views[0].width - 40
            _Views[4].height == 50
            
            _Views[5].top == (superView?.top)! + 20
            _Views[5].left == (superView?.left)! + 20
            _Views[5].width == 30
            _Views[5].height == 30
            
            
            bgView.backgroundColor = UIColor(complementaryFlatColorOf: UIColor.flatTeal())
            bgView.imageView = UIImageView()
            bgView.imageView?.contentMode = .scaleAspectFit
            bgView.imageView?.image = UIImage(named: "fishing")?.resize(toHeight: 0)
            
            
            contentView.backgroundColor = UIColor.flatWhite()
            
            email.textColor = UIColor.flatWhite()
            email.placeholder = "Email"
            
            firstName.textColor = UIColor.flatWhite()
            firstName.placeholder = "First Name"
            
            lastName.textColor = UIColor.flatWhite()
            lastName.placeholder = "Last Name"
            
            password.textColor = UIColor.flatWhite()
            password.placeholder = "Password"
            
            login.setTitle("Login", for: .normal)
            login.setTitleColor(UIColor.flatWhite(), for: .normal)
            login.backgroundColor = UIColor(complementaryFlatColorOf: UIColor.flatTeal())
            login.addTarget(self, action: #selector(LoginViewController.didLogin), for: .touchUpInside)
            
            
            back.setImage(UIImage(named:"back"), for: UIControlState.normal)
            back.addTarget(self, action: #selector(LoginViewController.goBack), for: .touchUpInside)
            
            bgView.contentView = contentView
            bgView.contentViewEdgeInsetsPreset = .none
            
        }
    }
    
    func didLogin(){
    
        let controller = ViewController()
        self.present(controller, animated: true, completion: nil)
    }
    
    func goBack(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = storyBoard.instantiateViewController(withIdentifier: "nav") as! UINavigationController
        
        self.present(controller, animated: true, completion: nil)
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
