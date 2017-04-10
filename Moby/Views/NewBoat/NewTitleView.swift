//
//  TitleView.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class NewTitleView: UIView {
    
    var title = UILabel()
    var newTitle = TextField()
    var save = FlatButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(title)
        self.addSubview(newTitle)
        self.addSubview(save)
        
        constrainViews()
        setup()
    }
    
    func setup(){
        
        title.textColor = THEME_1
        title.font = RobotoFont.bold(with: largeFontWidth)
        title.text = "Give Your Boat An Awesome Title"
        title.numberOfLines = 0
        
        newTitle.dividerActiveColor = THEME_1
        
        save.backgroundColor = THEME_1
        save.setTitle("Save", for: .normal)
        save.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
    }
    
    func constrainViews(){
    
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        newTitle.translatesAutoresizingMaskIntoConstraints = false
        newTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        newTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        newTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        newTitle.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        
        save.translatesAutoresizingMaskIntoConstraints = false
        save.topAnchor.constraint(equalTo: newTitle.bottomAnchor, constant: 20).isActive = true
        save.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        save.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        save.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
