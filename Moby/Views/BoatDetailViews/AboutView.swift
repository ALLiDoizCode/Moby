//
//  AboutView.swift
//  Moby
//
//  Created by Jonathan on 4/2/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class AboutView: UIView {

    var header = UILabel()
    var body = UILabel()
    var more = FlatButton()
    var currnetHeight:NSLayoutConstraint!
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(header)
        self.addSubview(body)
        self.addSubview(more)
        
        setup()
        constrain()
    
    }
    
    func constrain(){
        
        let margins = self.layoutMarginsGuide
        
        header.translatesAutoresizingMaskIntoConstraints = false
        header.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        header.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        
        body.translatesAutoresizingMaskIntoConstraints = false
        body.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        body.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        body.topAnchor.constraint(equalTo: header.topAnchor, constant: 40).isActive = true
        currnetHeight = body.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.45)
        currnetHeight.isActive = true
        body.clipsToBounds = true
        
        more.translatesAutoresizingMaskIntoConstraints = false
        more.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20).isActive = true
        more.topAnchor.constraint(equalTo: body.bottomAnchor, constant: -5).isActive = true
        
        self.setNeedsLayout()
        self.setNeedsDisplay()
    }
    
    func setup(){
        
        header.text = "About this boat"
        header.font = RobotoFont.medium(with: fontWidth + 1)
        header.textColor = TEXT_COLOR
        
        body.font = RobotoFont.light(with: fontWidth + 3)
        body.textColor = TEXT_COLOR
        body.numberOfLines = 0
        body.lineBreakMode = .byTruncatingTail
        
        more.setTitle("More", for: .normal)
        more.setTitleColor(THEME_1, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
