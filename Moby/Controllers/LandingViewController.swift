//
//  LandingViewController.swift
//  Moby
//
//  Created by Jonathan on 10/30/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cartography
import Animo

class LandingViewController: UIViewController {
    
    let icon = UIImageView()
    let login = FlatButton()
    let signUp = FlatButton()
    let logo = UILabel()
    let email = TextField()
    let password = TextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
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
        }
        
        DispatchQueue.main.async {
            print("main thread dispatch")
            
            self.setupViews()
            
            let views = [self.logo,self.email,self.password,self.login,self.signUp]
            
            constrain(views) { (_views) in
             
             let superView = _views[0].superview
             let left = _views[0].superview?.left
             let right = _views[0].superview?.right
             let top = _views[0].superview?.top
             let bottom = _views[0].superview?.bottom
             
             _views[0].centerX == (superView?.centerX)!
             _views[0].bottom == top! + 150
             _views[0].height == 85
             _views[0].width == 200
             
             _views[1].centerX == (superView?.centerX)!
             _views[1].top == _views[0].bottom + 100
             _views[1].left == left! + 30
             _views[1].right == right! - 30
             
             _views[2].centerX == (superView?.centerX)!
             _views[2].top == _views[1].bottom + 20
             _views[2].left == left! + 30
             _views[2].right == right! - 30
             
             _views[3].bottom == bottom! - 150
             _views[3].height == 70
             _views[3].left == left! + 30
             _views[3].right == right! - 30
              
             _views[4].bottom == _views[3].top - 20
             _views[4].height == 70
             _views[4].left == left! + 30
             _views[4].right == right! - 30
             
             
             
             }

        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signup(){
        
        self.performSegue(withIdentifier: "Signup", sender: self)
    }
    
    func setupViews(){
        
        self.view.backgroundColor = UIColor.flatTeal()
        
        email.placeholder = "Email"
        email.textColor = UIColor.flatWhite()
        email.isHidden = true
        self.view.addSubview(email)
        password.placeholder = "Password"
        password.textColor = UIColor.flatWhite()
        password.isHidden = true
        self.view.addSubview(password)
        
        
        icon.image = UIImage(named: "fishing")
        icon.contentMode = .scaleAspectFill
        icon.clipsToBounds = true
        
        login.backgroundColor = UIColor.clear
        login.borderColor = UIColor.flatWhite()
        login.setTitle("Login", for: .normal)
        let loginColor = UIColor(contrastingBlackOrWhiteColorOn: login.backgroundColor, isFlat: true)
        login.setTitleColor(loginColor, for: .normal)
        login.borderWidth = 2
        
        signUp.backgroundColor = UIColor(complementaryFlatColorOf: self.view.backgroundColor)
        signUp.setTitle("SignUp", for: .normal)
        signUp.addTarget(self, action: #selector(LandingViewController.signup), for: .touchUpInside)
        
        let signUpColor = UIColor(contrastingBlackOrWhiteColorOn: signUp.backgroundColor, isFlat: true)
        signUp.setTitleColor(signUpColor, for: .normal)
        
        logo.text = "Moby"
        logo.textColor = UIColor.flatTeal().lighten(byPercentage: 15)
        logo.textAlignment = .center
        logo.font = RobotoFont.bold(with: 72)
        //logo.isHidden = true
        
        self.view.addSubview(icon)
        self.view.addSubview(login)
        self.view.addSubview(signUp)
        self.view.addSubview(logo)
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
