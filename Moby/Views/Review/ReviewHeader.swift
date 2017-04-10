//
//  ReviewHeader.swift
//  Moby
//
//  Created by Jonathan on 4/4/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cosmos

class ReviewHeader: UIView {
    
    let reviewTitle = UILabel()
    let generalRating = CosmosView()
    let valueRating = CosmosView()
    let communicationRating = CosmosView()
    let accuracyRating = CosmosView()
    let valueTitle = UILabel()
    let communicationTitle = UILabel()
    let accuracyTitle = UILabel()
    let backBtn = FlatButton()
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(reviewTitle)
        self.addSubview(generalRating)
        self.addSubview(valueRating)
        self.addSubview(communicationRating)
        self.addSubview(accuracyRating)
        self.addSubview(valueTitle)
        self.addSubview(communicationTitle)
        self.addSubview(accuracyTitle)
        self.addSubview(backBtn)
        
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        let backImage = UIImage(named: "back2")
        backBtn.image = backImage
        backBtn.imageView?.contentMode = .scaleAspectFit
        
        reviewTitle.font = RobotoFont.bold(with: largeFontWidth)
        reviewTitle.textColor = TEXT_COLOR
        
        valueTitle.text = "Value"
        valueTitle.font = RobotoFont.regular(with: fontWidth)
        valueTitle.textColor = TEXT_COLOR
        accuracyTitle.text = "Accuracy"
        accuracyTitle.font = RobotoFont.regular(with: fontWidth)
        accuracyTitle.textColor = TEXT_COLOR
        communicationTitle.text = "Communication"
        communicationTitle.font = RobotoFont.regular(with: fontWidth)
        communicationTitle.textColor = TEXT_COLOR
        
        generalRating.settings.fillMode = .precise
        generalRating.settings.starSize = Double(largeFontWidth - 10)
        generalRating.settings.starMargin = 0
        generalRating.settings.updateOnTouch = false
        generalRating.settings.filledColor = THEME_1
        generalRating.settings.emptyBorderColor = THEME_1
        generalRating.settings.filledBorderColor = THEME_1
        
        valueRating.settings.fillMode = .precise
        valueRating.settings.starSize = Double(fontWidth)
        valueRating.settings.starMargin = 0
        valueRating.settings.updateOnTouch = false
        valueRating.settings.filledColor = THEME_1
        valueRating.settings.emptyBorderColor = THEME_1
        valueRating.settings.filledBorderColor = THEME_1
        
        communicationRating.settings.fillMode = .precise
        communicationRating.settings.starSize = Double(fontWidth)
        communicationRating.settings.starMargin = 0
        communicationRating.settings.updateOnTouch = false
        communicationRating.settings.filledColor = THEME_1
        communicationRating.settings.emptyBorderColor = THEME_1
        communicationRating.settings.filledBorderColor = THEME_1
        
        accuracyRating.settings.fillMode = .precise
        accuracyRating.settings.starSize = Double(fontWidth)
        accuracyRating.settings.starMargin = 0
        accuracyRating.settings.updateOnTouch = false
        accuracyRating.settings.filledColor = THEME_1
        accuracyRating.settings.emptyBorderColor = THEME_1
        accuracyRating.settings.filledBorderColor = THEME_1
    
    }
    
    func constrain(){
        
        let margins = self.layoutMarginsGuide
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
        backBtn.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        backBtn.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.07).isActive = true
        backBtn.heightAnchor.constraint(equalTo: backBtn.widthAnchor, multiplier: 1).isActive = true
        
        reviewTitle.translatesAutoresizingMaskIntoConstraints = false
        reviewTitle.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        reviewTitle.topAnchor.constraint(equalTo: backBtn.bottomAnchor, constant: 30).isActive = true
        
        generalRating.translatesAutoresizingMaskIntoConstraints = false
        generalRating.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        generalRating.topAnchor.constraint(equalTo: reviewTitle.bottomAnchor, constant: 0).isActive = true
        
        valueTitle.translatesAutoresizingMaskIntoConstraints = false
        valueTitle.topAnchor.constraint(equalTo: generalRating.bottomAnchor, constant: 50).isActive = true
        valueTitle.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        
        accuracyTitle.translatesAutoresizingMaskIntoConstraints = false
        accuracyTitle.topAnchor.constraint(equalTo: valueTitle.bottomAnchor, constant: 5).isActive = true
        accuracyTitle.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        
        communicationTitle.translatesAutoresizingMaskIntoConstraints = false
        communicationTitle.topAnchor.constraint(equalTo: accuracyTitle.bottomAnchor, constant: 5).isActive = true
        communicationTitle.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 20).isActive = true
        
        valueRating.translatesAutoresizingMaskIntoConstraints = false
        valueRating.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20).isActive = true
        valueRating.topAnchor.constraint(equalTo: valueTitle.topAnchor, constant: 0).isActive = true
        
        accuracyRating.translatesAutoresizingMaskIntoConstraints = false
        accuracyRating.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20).isActive = true
        accuracyRating.topAnchor.constraint(equalTo: accuracyTitle.topAnchor, constant: 0).isActive = true
        
        communicationRating.translatesAutoresizingMaskIntoConstraints = false
        communicationRating.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -20).isActive = true
        communicationRating.topAnchor.constraint(equalTo: communicationTitle.topAnchor, constant: 0).isActive = true
    }

}
