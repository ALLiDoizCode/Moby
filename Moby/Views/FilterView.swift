//
//  FIlterVIew.swift
//  Moby
//
//  Created by Jonathan on 4/1/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class FilterView: UIView {
    
    var upArrow = FlatButton()
    var views:[UIView] = []
    var anywhereBar:UIView!
    var anytimeBar:UIView!
    var guestBar:UIView!
    var tap1 = UITapGestureRecognizer()
    var tap2 = UITapGestureRecognizer()
    var tap3 = UITapGestureRecognizer()
   
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
         self.addSubview(upArrow)
        
         let image = UIImage(named: "like")
    
         anywhereBar = makeBar(text: "Anywhere", image: image!)
         anytimeBar = makeBar(text: "Anytime", image: image!)
         guestBar = makeBar(text: "Guest", image: image!)
        
         let upArrowImage = UIImage(named: "up")
         //let upArrowImageView = UIImageView()
        
         upArrow.image = upArrowImage
         upArrow.imageView?.contentMode = .scaleAspectFit
    
         anywhereBar.addGestureRecognizer(tap1)
         tap1.numberOfTapsRequired = 1
         anytimeBar.addGestureRecognizer(tap2)
         tap2.numberOfTapsRequired = 1
         guestBar.addGestureRecognizer(tap3)
         tap3.numberOfTapsRequired = 1
        
         views = [anywhereBar,anytimeBar,guestBar]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAnchors() {
        
        let margins = self.superview?.layoutMarginsGuide
        
        upArrow.translatesAutoresizingMaskIntoConstraints = false
        upArrow.topAnchor.constraint(equalTo: (margins?.topAnchor)!, constant: 40).isActive = true
        upArrow.leftAnchor.constraint(equalTo: (margins?.leftAnchor)!, constant: 20).isActive = true
        upArrow.widthAnchor.constraint(equalTo: (margins?.widthAnchor)!, multiplier: 0.045).isActive = true
        upArrow.heightAnchor.constraint(equalTo: upArrow.widthAnchor, multiplier: 1).isActive = true
        
        anywhereBar.topAnchor.constraint(equalTo: upArrow.bottomAnchor, constant: 20).isActive = true
        anytimeBar.topAnchor.constraint(equalTo: anywhereBar.bottomAnchor, constant: 7).isActive = true
        guestBar.topAnchor.constraint(equalTo: anytimeBar.bottomAnchor, constant: 7).isActive = true
        
        for i in 0 ..< views.count {
            
            //views[i].topAnchor.constraint(equalTo: margins.topAnchor, constant: 50).isActive = true
            views[i].leftAnchor.constraint(equalTo: (margins?.leftAnchor)!, constant: 0).isActive = true
            views[i].rightAnchor.constraint(equalTo: (margins?.rightAnchor)!, constant: 0).isActive = true
            views[i].heightAnchor.constraint(equalTo: (margins?.heightAnchor)!, multiplier: 0.065 ).isActive = true
        }

    }
    
    func setup(){
        
        
        
    }
    
    func makeBar(text:String,image:UIImage) -> UIView {
        
        let container = UIView()
        let label = UILabel()
        let icon = UIImageView()
        
        label.text = text
        label.textColor = THEME_2
        label.font = RobotoFont.bold(with: fontWidth)
        
        self.addSubview(container)
        container.addSubview(label)
        container.addSubview(icon)
        
        container.backgroundColor = THEME_3
        container.cornerRadius = 3
        
        container.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        
        icon.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 0).isActive = true
        icon.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 30).isActive = true
        icon.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.55).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 0).isActive = true
        
        label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 30).isActive = true
        label.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        
        icon.image = image
        icon.contentMode = .scaleAspectFill
        
        return container
    }
}
