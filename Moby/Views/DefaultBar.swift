//
//  DefaultBar.swift
//  Moby
//
//  Created by Jonathan on 4/1/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class DefaultBar: UIView {

    var bar:UIView!
    var tap1 = UITapGestureRecognizer()
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "search")
        
        tap1.numberOfTapsRequired = 1
        bar = makeBar(text: "Anywhere Anytime guest", image: image!)
        bar.addGestureRecognizer(tap1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setAnchors() {
        
        let margins = self.superview?.layoutMarginsGuide
        
        bar.topAnchor.constraint(equalTo: (margins?.topAnchor)!, constant: 20).isActive = true
        bar.leftAnchor.constraint(equalTo: (margins?.leftAnchor)!, constant: 0).isActive = true
        bar.rightAnchor.constraint(equalTo: (margins?.rightAnchor)!, constant: 0).isActive = true
        bar.heightAnchor.constraint(equalTo: (margins?.heightAnchor)!, multiplier: 0.065 ).isActive = true
        
        
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
        icon.image = image
        icon.contentMode = .scaleAspectFill
        
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
        
        label.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 20).isActive = true
        label.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        
        return container
    }
}
