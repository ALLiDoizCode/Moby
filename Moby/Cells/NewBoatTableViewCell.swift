//
//  NewBoatTableViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/6/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class NewBoatTableViewCell: UITableViewCell {
    
    var infoLabel = UILabel()
    var icon = UIImageView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(infoLabel)
        self.addSubview(icon)
        
        constrainViews()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        infoLabel.textColor = TEXT_COLOR
        infoLabel.font = RobotoFont.bold(with: largeFontWidth)
        icon.contentMode = .scaleAspectFill
        
        
    }
    
    func constrainViews(){
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        icon.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 1).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
