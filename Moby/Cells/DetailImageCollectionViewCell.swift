//
//  DetailImageCollectionViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/2/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class DetailImageCollectionViewCell: UICollectionViewCell {
    
    var boatImage = UIImageView()
    var imageHeight:NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Color.grey.lighten2
        self.addSubview(boatImage)
        //let margin = self.layoutMarginsGuide
        boatImage.translatesAutoresizingMaskIntoConstraints = false
        //boatImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        boatImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        boatImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        imageHeight = boatImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1)
        imageHeight.isActive = true
        boatImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        
        boatImage.contentMode = .scaleAspectFill
        //boatImage.layer.masksToBounds = true
        boatImage.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
}
