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
import BubbleTransition
import Player

class LandingViewController: UIViewController,UIViewControllerTransitioningDelegate,PlayerDelegate {
    
    fileprivate var player: Player!
    
    let bgImageView = UIImageView()
    let blur = UIView()
    let iconNext = FlatButton()
    let nextImageView = UIImageView()
    let logo = UILabel()
    let boatLabel = UILabel()
    let transition = BubbleTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url:URL!
        
        if let path = Bundle.main.path(forResource: "video", ofType: "mp4") {
            url = URL(fileURLWithPath: path)
            
        }
        else {
            print("Oops, something wrong when playing video.mp4")
        }
        
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        DispatchQueue.main.async {
            print("main thread dispatch")
            
            self.setupViews()
            
            let views:[UIView] = [self.logo,self.bgImageView,self.blur,self.iconNext,self.nextImageView,self.boatLabel]
            
            constrain(views) { (_views) in
             
             let superView = _views[0].superview
             let left = _views[0].superview?.left
             let right = _views[0].superview?.right
             let top = (_views[0].superview?.top)!
             let bottom = (_views[0].superview?.bottom)!
             
             _views[0].top == _views[1].top
             _views[0].height == (superView?.height)! * 0.15
             _views[0].width == (superView?.width)! * 0.7
             _views[0].right == right!
            
             _views[1].top == top
             _views[1].height == (superView?.height)! * 0.8
             _views[1].left == left!
             _views[1].right == right! * 1.2
             
             _views[2].top == _views[1].top
             _views[2].bottom == _views[1].bottom
             _views[2].left == left!
             _views[2].right == right!
                
             _views[3].top == _views[1].bottom + 30
             _views[3].bottom == (superView?.bottom)! - 30
             _views[3].centerX == (superView?.centerX)! + 80
             _views[3].width == _views[3].height
                
             _views[4].center == (_views[3].center)
             _views[4].height == (_views[3].height) * 0.6
             _views[4].width == _views[4].height
                
             _views[5].centerY == _views[3].centerY
             _views[5].right == _views[3].left - 20
             _views[5].width == (superView?.width)! * 0.45
             
            }

        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //self.player.playFromBeginning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signup(){
        
        let controller = SignupController()
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    func goTologin(){
        
        let controller = LoginViewController()
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
        self.navigationController?.pushViewController(controller, animated: false)
    }
    
    func setupViews(){
        
        let logoWidth = self.view.frame.width * 0.07
        
        self.view.backgroundColor = Color.grey.lighten5
        
        let nextImage = UIImage(named: "next")
        nextImageView.image = nextImage
        nextImageView.contentMode = .scaleAspectFill
        
        iconNext.backgroundColor = Color.grey.lighten2
        iconNext.shapePreset = .circle
        //iconNext.clipsToBounds = true
    
        
        boatLabel.text = "Get Your Boat"
        boatLabel.font = RobotoFont.bold(with: logoWidth)
        boatLabel.textColor = Color.grey.lighten2
        
        logo.text = "Where There's Water There's Moby"
        logo.textColor = Color.grey.lighten5
        logo.numberOfLines = 0
        logo.textAlignment = .left
        logo.font = RobotoFont.bold(with: logoWidth)
        //logo.isHidden = true
        
        let bgImage = UIImage(named: "man")
        
        bgImageView.image = bgImage
        bgImageView.contentMode = .scaleAspectFill
        
        blur.backgroundColor = Color.black.withAlphaComponent(0.2)
        
        self.view.addSubview(boatLabel)
        self.view.addSubview(bgImageView)
        self.view.addSubview(blur)
        self.view.addSubview(logo)
        self.view.addSubview(iconNext)
        iconNext.addSubview(nextImageView)
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = self.view.center
        transition.bubbleColor = self.view.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .dismiss
        transition.startingPoint = self.view.center
        transition.bubbleColor = self.view.backgroundColor!
        return transition
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
