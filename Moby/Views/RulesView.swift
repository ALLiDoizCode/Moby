//
//  Rules.swift
//  Moby
//
//  Created by Jonathan on 4/6/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class RulesView: UIView {
    var doneButton = FlatButton()
    var textBox = UITextView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(doneButton)
        self.addSubview(textBox)
        
        self.backgroundColor = THEME_2
        setup()
        constrainView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
        
        textBox.font = RobotoFont.regular(with: fontWidth + 10)
        textBox.textColor = TEXT_COLOR
        
        doneButton.backgroundColor = THEME_1
        doneButton.setTitle("Save Rules", for: .normal)
    }
    
    func constrainView(){
        
        textBox.translatesAutoresizingMaskIntoConstraints = false
        textBox.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        textBox.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        textBox.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        textBox.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.topAnchor.constraint(equalTo: textBox.bottomAnchor, constant: 20).isActive = true
        doneButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        doneButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
    }
}
