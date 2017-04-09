//
//  ProfileTableViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/8/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class ProfileTableViewCell: UITableViewCell {
    
    let label = UILabel()
    let icon = UIImageView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(label)
        self.addSubview(icon)
        
        self.backgroundColor = THEME_2
        
        label.font = RobotoFont.regular(with: largeFontWidth)
        label.textColor = TEXT_COLOR
        icon.contentMode = .scaleAspectFit
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        icon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        icon.heightAnchor.constraint(equalTo: icon.widthAnchor, multiplier: 1).isActive = true
        icon.widthAnchor.constraint(equalTo: icon.heightAnchor, multiplier: 0.8).isActive = true
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
