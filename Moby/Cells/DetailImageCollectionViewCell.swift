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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(boatImage)
        let margin = self.layoutMarginsGuide
        boatImage.translatesAutoresizingMaskIntoConstraints = false
        boatImage.topAnchor.constraint(equalTo: margin.topAnchor, constant: 0).isActive = true
        boatImage.leftAnchor.constraint(equalTo: margin.leftAnchor, constant: -10).isActive = true
        boatImage.rightAnchor.constraint(equalTo: margin.rightAnchor, constant: 10).isActive = true
        boatImage.heightAnchor.constraint(equalTo: margin.heightAnchor, multiplier: 1).isActive = true
        
        boatImage.contentMode = .scaleAspectFill
        boatImage.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
}
