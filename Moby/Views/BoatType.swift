//
//  BoatType.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class BoatType: UIView {
    
    var title = UILabel()
    var button1 = FlatButton()
    var button2 = FlatButton()
    var button3 = FlatButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(title)
        self.addSubview(button1)
        self.addSubview(button2)
        self.addSubview(button3)
        
        constrainViews()
        setup()
    }
    
    func setup(){
        
        title.textColor = THEME_1
        title.font = RobotoFont.bold(with: largeFontWidth)
        title.text = "What Kind Of Boating Experience Are You Offering"
        title.numberOfLines = 0
        
        button1.backgroundColor = THEME_1
        button1.setTitle("Fishing", for: .normal)
        button1.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        
        button2.backgroundColor = THEME_1
        button2.setTitle("Cruise", for: .normal)
        button2.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        
        button3.backgroundColor = THEME_1
        button3.setTitle("Party", for: .normal)
        button3.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
    }
    
    func constrainViews(){
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 50).isActive = true
        button1.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        button1.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        button1.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20).isActive = true
        button2.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        button2.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        button2.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
        
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20).isActive = true
        button3.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        button3.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        button3.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
