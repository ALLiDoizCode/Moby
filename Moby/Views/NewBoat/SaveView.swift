//
//  SaveView.swift
//  Moby
//
//  Created by Jonathan on 4/7/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class SaveView: UIView {
    
    var saveBtn = FlatButton()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.borderWidth = 0.2
        self.borderColor = BORDER_COLOR
        
        self.addSubview(saveBtn)
        
        constrain()
        setup()
    }
    
    func constrain(){
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        saveBtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        saveBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        saveBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        
    }
    
    func setup(){
        
        saveBtn.backgroundColor = THEME_1
        saveBtn.setTitle("Save", for: .normal)
        saveBtn.setTitleColor(THEME_2, for: .normal)
        saveBtn.cornerRadiusPreset = .cornerRadius2
        saveBtn.titleLabel?.font = RobotoFont.regular(with: largeFontWidth)
        self.backgroundColor = THEME_2
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
