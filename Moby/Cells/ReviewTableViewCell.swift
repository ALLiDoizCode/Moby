//
//  ReviewTableViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/4/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cosmos

class ReviewTableViewCell: UITableViewCell {

    var reviewName = UILabel()
    var reviewDate = UILabel()
    var body = UILabel()
    var more = FlatButton()
    var profileImage = UIImageView()
    let stars = CosmosView()
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        
        self.addSubview(profileImage)
        self.addSubview(reviewName)
        self.addSubview(reviewDate)
        self.addSubview(body)
        self.addSubview(more)
        self.addSubview(stars)
        self.backgroundColor = THEME_2
        
        constrain()
        setup()
    }
    
    func constrain(){
        
        let margins = self.layoutMarginsGuide
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        profileImage.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.10).isActive = true
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor, multiplier: 1).isActive = true
        
        reviewName.translatesAutoresizingMaskIntoConstraints = false
        reviewName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        reviewName.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 0).isActive = true
        
        reviewDate.translatesAutoresizingMaskIntoConstraints = false
        reviewDate.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        reviewDate.topAnchor.constraint(equalTo: reviewName.bottomAnchor, constant: 0).isActive = true
        
        stars.translatesAutoresizingMaskIntoConstraints = false
        stars.rightAnchor.constraint(equalTo: body.rightAnchor, constant: 0).isActive = true
        stars.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.3).isActive = true
        stars.bottomAnchor.constraint(equalTo: reviewDate.bottomAnchor, constant: 0).isActive = true
        
        body.translatesAutoresizingMaskIntoConstraints = false
        body.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20).isActive = true
        body.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20).isActive = true
        body.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        body.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30).isActive = true
        body.clipsToBounds = true
        
       
        self.layoutIfNeeded()
        self.setNeedsDisplay()
    }
    
    func setup(){
        
        self.borderWidth = 0.2
        self.borderColor = BORDER_COLOR
        
        print("feature height is \(profileImage.frame.height)")
        
        profileImage.contentMode = .scaleAspectFill
        profileImage.cornerRadius = (UIScreen.main.bounds.width * 0.10)/2
        //profileImage.clipsToBounds = true
        profileImage.layer.masksToBounds = true
        
        reviewName.textColor = TEXT_COLOR
        reviewName.font = RobotoFont.bold(with: fontWidth)
        reviewDate.textColor = TEXT_COLOR
        reviewDate.font = RobotoFont.regular(with: fontWidth)
        
        body.font = RobotoFont.light(with: fontWidth + 3)
        body.textColor = TEXT_COLOR
        body.numberOfLines = 0
        body.lineBreakMode = .byTruncatingTail
        
        //more.setTitle("", for: .normal)
        more.setTitleColor(THEME_1, for: .normal)
        
        stars.settings.fillMode = .precise
        stars.settings.starSize = Double(largeFontWidth - 10)
        stars.settings.starMargin = 0
        stars.settings.updateOnTouch = false
        stars.settings.filledColor = THEME_1
        stars.settings.emptyBorderColor = THEME_1
        stars.settings.filledBorderColor = THEME_1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
