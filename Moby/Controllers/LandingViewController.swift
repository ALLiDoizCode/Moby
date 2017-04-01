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

class LandingViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    let iconNext = FlatButton()
    let nextImageView = UIImageView()
    let logo = UILabel()
    let boatLabel = UILabel()
    let transition = BubbleTransition()
    let loginBtn = FlatButton()
    let signupBtn = FlatButton()
    var fontWidth:CGFloat!
    var views:[UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = SearchModel()
        
        search.key1 = "location"
        search.value1 = "Charleston"
        
        SearchClient().findCollections(collection: BOAT_COLLECTION, search: search) { (objects) in
            
        }
        
        //let image = UIImage(named: "dock")
        
        /*Client().newboatImage(boatId: "EC168769-D638-4EC6-8E66-90670D04E47B", image: image!,main:true, path: "dock") { (id) in
            
            
        }*/
        
        
        /*StripeClient().charge(customer: "cus_AM41xvflcqRbUX", account: "acct_1A1MMgFQd4HQDGqm", amount: "20642064") { (id) in
            
           Client().newCharge(customer: "5E43B945-ACBA-4398-81E3-F3177C30F546", charge: id, completion: { (id) in
            
                Client().newTrip(captin:  "B5950B36-E0C8-4D1C-A1B1-D98D7BE4B3F8", boat: "B8831794-913A-42F8-B7B0-476E10AFA553", charge: id, duration: "4", completion: { (tripId) in
                    
                    print("saved tripe id \(tripId)")
                })
           })
        }*/
        
        /*Client().token { (token) in
            
            Client().auth(token: DataStore().getToken()) { (success) in
                
               
            }
        }*/
        
        self.navigationController?.isNavigationBarHidden = true
        fontWidth = self.view.frame.width * CGFloat(0.07)
        
        setupViews()
        
        let nextView = makeNextView()
        
        self.view.addSubview(nextView)
        self.view.addSubview(logo)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signupBtn)
        
        views = [logo,signupBtn,loginBtn,nextView]
        
        constrain(views) { (_views) in
            
            let top = (_views[0].superview?.top)!
            let bottom = (_views[0].superview?.bottom)!
            let left = (_views[0].superview?.left)!
            let right = (_views[0].superview?.right)!
            let width = (_views[0].superview?.width)!
            let height = (_views[0].superview?.height)!
            let center = (_views[0].superview?.center)!
            let centerX = (_views[0].superview?.centerX)!
            let centerY = (_views[0].superview?.centerY)!
            
            _views[0].top == top + 20
            _views[0].left == left + 20
            _views[0].width == width * 0.7
            
            _views[1].top == centerY
            _views[1].centerX == centerX
            _views[1].width == width * 0.9
            _views[1].height == width * 0.2
            
            _views[2].top == _views[1].bottom + 20
            _views[2].centerX == centerX
            _views[2].width == width * 0.9
            _views[2].height == width * 0.2
            
            _views[3].top == _views[2].bottom + 20
            _views[3].centerX == centerX
            _views[3].width == width * 0.7
            _views[3].height == width * 0.2
            
        }
        
        /*DispatchQueue.main.async {
            print("main thread dispatch")
            
            

        }*/
        
        
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
    
    func goToBoats(){
        
        let controller = ExploreViewController()
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
    
    func makeNextView() -> UIView{
        
        let container = UIView()
        
        container.addSubview(iconNext)
        container.addSubview(boatLabel)
        iconNext.addSubview(nextImageView)
        
        let nextImage = UIImage(named: "next")
        nextImageView.image = nextImage
        nextImageView.contentMode = .scaleAspectFill
        
        iconNext.backgroundColor = Color.grey.lighten1
        iconNext.shapePreset = .circle
        iconNext.addTarget(self, action: #selector(LandingViewController.goToBoats), for: .touchUpInside)
        //iconNext.clipsToBounds = true
        
        
        boatLabel.text = "Get Your Boat"
        boatLabel.font = RobotoFont.bold(with: fontWidth)
        boatLabel.textColor = Color.grey.lighten1
        
        constrain(iconNext,nextImageView,boatLabel) { (_iconNext,_nextImageView,_boatLabel) in
            
            _iconNext.centerY == (_iconNext.superview?.centerY)!
            _iconNext.right == (_iconNext.superview?.right)! - 20
            _iconNext.height == (_iconNext.superview?.height)! * 0.7
            _iconNext.width == _iconNext.height
            
            _nextImageView.center == (_nextImageView.superview?.center)!
            _nextImageView.height == (_nextImageView.superview?.height)! * 0.6
            _nextImageView.width ==  _nextImageView.height
            
            _boatLabel.centerY == _iconNext.centerY
            _boatLabel.right == _iconNext.left
            _boatLabel.width == (_boatLabel.superview?.width)! * 0.75
        }
        
        return container
    }
    
    func setupViews(){
        
        self.view.backgroundColor = Color.grey.lighten5
        
        logo.text = "Where There's Water There's Moby"
        logo.textColor = Color.grey.lighten1
        logo.numberOfLines = 0
        logo.textAlignment = .left
        logo.font = RobotoFont.bold(with: fontWidth)
        
        
        signupBtn.backgroundColor = Color.grey.lighten1
        signupBtn.setTitle("Sign Up", for: .normal)
        signupBtn.titleColor = Color.grey.lighten5
        signupBtn.titleLabel?.font = RobotoFont.bold(with: fontWidth)
        
        loginBtn.backgroundColor = Color.clear
        loginBtn.borderColor = Color.grey.lighten1
        loginBtn.borderWidthPreset = .border3
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.titleColor = Color.grey.lighten1
        loginBtn.titleLabel?.font = RobotoFont.bold(with: fontWidth)
        
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .present
        transition.startingPoint = self.iconNext.center
        transition.bubbleColor = self.view.backgroundColor!
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        transition.transitionMode = .dismiss
        transition.startingPoint = self.iconNext.center
        transition.bubbleColor = self.view.backgroundColor!
        return transition
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let controller = segue.destination
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .custom
    }
 

}
