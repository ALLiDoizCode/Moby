//
//  IconView.swift
//  Moby
//
//  Created by Jonathan on 4/1/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class IconView: UIView {
    
    var icon = UIImageView()
    var label = UILabel()
    var gesture = UITapGestureRecognizer()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        gesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(gesture)
        
        let image = UIImage(named: "heart")
        
        let font = UIScreen.main.bounds.width * 0.03
        
        self.addSubview(icon)
        self.addSubview(label)
        
        icon.image = image
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = self.layoutMarginsGuide
        
        icon.centerXAnchor.constraint(equalTo: margins.centerXAnchor, constant: 0).isActive = true
        icon.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -10).isActive = true
        icon.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.3).isActive = true
        icon.heightAnchor.constraint(equalTo: icon.widthAnchor, multiplier: 1).isActive = true
        
        label.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
        label.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        
        label.font = RobotoFont.medium(with: font)
        label.textColor = TEXT_COLOR
        label.text = "Text"
        label.textAlignment = .center
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
