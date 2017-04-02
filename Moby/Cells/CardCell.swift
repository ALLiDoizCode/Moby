//
//  presentercardViewController.swift
//  Moby
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cosmos

class CardCell: TableViewCell {
    
    var bgImageView = UIImageView()
    var likeImageView = UIImageView()
    var InstantImageView = UIImageView()
    var favButton = FlatButton()
    var priceLbl = UILabel()
    var titleLbl = UILabel()
    var reviewsLbl = UILabel()
    var fontWidth:CGFloat!
    let stars = CosmosView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = Color.clear
        self.addSubview(bgImageView)
        self.addSubview(favButton)
        self.addSubview(priceLbl)
        self.addSubview(titleLbl)
        self.addSubview(reviewsLbl)
        favButton.addSubview(likeImageView)
        self.addSubview(InstantImageView)
        self.addSubview(stars)
        //favButton.isHidden = true
        
        fontWidth = self.frame.width * 0.05
        
        let margins = self.layoutMarginsGuide
        
        stars.translatesAutoresizingMaskIntoConstraints = false
        //stars.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        stars.leftAnchor.constraint(equalTo: bgImageView.leftAnchor, constant: 0).isActive = true
        stars.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
        reviewsLbl.translatesAutoresizingMaskIntoConstraints = false
        //reviewsLbl.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        reviewsLbl.leadingAnchor.constraint(equalTo: stars.trailingAnchor, constant: 0).isActive = true
        reviewsLbl.topAnchor.constraint(equalTo: stars.topAnchor, constant: 0).isActive = true
        
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.topAnchor.constraint(equalTo: bgImageView.topAnchor, constant: 15).isActive = true
        favButton.rightAnchor.constraint(equalTo: bgImageView.rightAnchor, constant: -15).isActive = true
        favButton.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.08).isActive = true
        favButton.heightAnchor.constraint(equalTo: favButton.widthAnchor, multiplier: 1).isActive = true
        
        priceLbl.translatesAutoresizingMaskIntoConstraints = false
        //priceLbl.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.15).isActive = true
        priceLbl.leadingAnchor.constraint(equalTo: bgImageView.leadingAnchor, constant: 0).isActive = true
        priceLbl.trailingAnchor.constraint(equalTo: InstantImageView.leadingAnchor, constant: 0).isActive = true
        priceLbl.bottomAnchor.constraint(equalTo: stars.topAnchor, constant: -5).isActive = true
        
        InstantImageView.translatesAutoresizingMaskIntoConstraints = false
        InstantImageView.leftAnchor.constraint(equalTo: priceLbl.rightAnchor, constant: 0).isActive = true
        InstantImageView.centerYAnchor.constraint(equalTo: priceLbl.centerYAnchor, constant: 3).isActive = true
        InstantImageView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.045).isActive = true
        InstantImageView.heightAnchor.constraint(equalTo: InstantImageView.widthAnchor, multiplier: 1).isActive = true
        
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        //titleLbl.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 0).isActive = true
        titleLbl.leadingAnchor.constraint(equalTo: InstantImageView.trailingAnchor, constant: 0).isActive = true
        titleLbl.bottomAnchor.constraint(equalTo: priceLbl.bottomAnchor, constant: 0).isActive = true
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 1).isActive = true
        bgImageView.centerXAnchor.constraint(equalTo: margins.centerXAnchor, constant: 0).isActive = true
        bgImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 35).isActive = true
        bgImageView.bottomAnchor.constraint(equalTo: priceLbl.topAnchor, constant: -12).isActive = true
        
        likeImageView.translatesAutoresizingMaskIntoConstraints = false
        likeImageView.topAnchor.constraint(equalTo: bgImageView.topAnchor, constant: 10).isActive = true
        likeImageView.rightAnchor.constraint(equalTo: bgImageView.rightAnchor, constant: -10).isActive = true
        likeImageView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.07).isActive = true
        likeImageView.widthAnchor.constraint(equalTo: likeImageView.heightAnchor, multiplier: 1).isActive = true
        
        setupViews()
        
    }
    
    func setupViews(){
        
        let likeImage = UIImage(named:"like")
        let instantImage = UIImage(named: "flash")
       
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        likeImageView.contentMode = .scaleAspectFit
        likeImageView.image = likeImage
        InstantImageView.image = instantImage
        InstantImageView.contentMode = .scaleAspectFit
        favButton.backgroundColor = Color.clear
        priceLbl.textColor = TEXT_COLOR
        priceLbl.font = RobotoFont.bold(with: fontWidth)
        //priceLbl.backgroundColor = Color.red
        titleLbl.textColor = TEXT_COLOR
        titleLbl.font = RobotoFont.regular(with: fontWidth)
        reviewsLbl.textColor = TEXT_COLOR
        reviewsLbl.font = RobotoFont.regular(with: fontWidth/1.5)
        stars.settings.fillMode = .precise
        stars.settings.starSize = Double(fontWidth)
        stars.settings.starMargin = 0
        stars.settings.updateOnTouch = false
        stars.settings.filledColor = THEME_1
        stars.settings.emptyBorderColor = THEME_1
        stars.settings.filledBorderColor = THEME_1
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}

