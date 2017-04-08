//
//  PayTabView.swift
//  Moby
//
//  Created by Jonathan on 4/3/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class PayTabView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var payBtn = FlatButton()
    var priceLabel = UILabel()
    var subLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       self.borderWidth = 0.2
       self.borderColor = BORDER_COLOR
        
        self.addSubview(payBtn)
        self.addSubview(priceLabel)
        self.addSubview(subLabel)
        
        constrain()
        setup()
    }
    
    func constrain(){
        
        let margins = self.layoutMarginsGuide
        
        payBtn.translatesAutoresizingMaskIntoConstraints = false
        payBtn.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: 0).isActive = true
        payBtn.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20).isActive = true
        payBtn.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.7).isActive = true
        payBtn.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.4).isActive = true
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        priceLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor, constant: 5).isActive = true
        subLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 0).isActive = true
    }
    
    func setup(){
        
        payBtn.backgroundColor = THEME_1
        payBtn.setTitle("Book Boat", for: .normal)
        payBtn.setTitleColor(THEME_2, for: .normal)
        payBtn.cornerRadiusPreset = .cornerRadius2
        payBtn.titleLabel?.font = RobotoFont.regular(with: largeFontWidth)
        
        priceLabel.textColor = TEXT_COLOR
        priceLabel.font = RobotoFont.bold(with: largeFontWidth)
        
        subLabel.textColor = TEXT_COLOR
        subLabel.font = RobotoFont.light(with: fontWidth)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
