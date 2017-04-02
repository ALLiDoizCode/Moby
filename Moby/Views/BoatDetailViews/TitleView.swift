//
//  TitleView.swift
//  Moby
//
//  Created by Jonathan on 4/2/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class TitleView: UIView {

    var boatTitle = UILabel()
    var subTitle = UILabel()
    var nameTitle = UILabel()
    var nameLabel = UILabel()
    var profileImage = UIImageView()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(boatTitle)
        self.addSubview(subTitle)
        self.addSubview(nameTitle)
        self.addSubview(nameLabel)
        self.addSubview(profileImage)
        
        constrain()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constrain() {
        
        let margins = self.layoutMarginsGuide
        
        boatTitle.translatesAutoresizingMaskIntoConstraints = false
        boatTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        boatTitle.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -30).isActive = true
        boatTitle.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.leadingAnchor.constraint(equalTo: boatTitle.leadingAnchor, constant: 0).isActive = true
        subTitle.topAnchor.constraint(equalTo: boatTitle.bottomAnchor, constant: 30).isActive = true
        
        nameTitle.translatesAutoresizingMaskIntoConstraints = false
        nameTitle.leadingAnchor.constraint(equalTo: boatTitle.leadingAnchor, constant: 0).isActive = true
        nameTitle.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 0).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: nameTitle.trailingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: nameTitle.topAnchor, constant: 0).isActive = true
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -30).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor, constant: -5).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.17).isActive = true
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor, multiplier: 1).isActive = true
        
         self.layoutIfNeeded()
         self.setNeedsDisplay()
        
    }
    
    func setup(){
        
        boatTitle.textColor = TEXT_COLOR
        boatTitle.numberOfLines = 2
        boatTitle.font = RobotoFont.bold(with: largeFontWidth)
        
        subTitle.textColor = TEXT_COLOR
        subTitle.font = RobotoFont.medium(with: fontWidth + 1)
        
        nameTitle.textColor = TEXT_COLOR
        nameTitle.font = RobotoFont.light(with: fontWidth + 1)
        nameTitle.text = "Owned by"
        nameLabel.textColor = THEME_1
        nameLabel.font = RobotoFont.light(with: fontWidth + 1)
        
        //profileImage.height = UIScreen.main.bounds.width * 0.15
        print("image height is \(profileImage.frame.width)")
        
        profileImage.cornerRadius = profileImage.frame.height/2
        profileImage.layer.masksToBounds =  true
    
        profileImage.contentMode = .scaleAspectFill
    }

}
