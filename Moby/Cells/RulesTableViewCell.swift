//
//  AmenitiesTableViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/5/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class RulesTableViewCell: UITableViewCell {
    
    var rulesLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(rulesLabel)
        
        rulesLabel.font = RobotoFont.medium(with: largeFontWidth)
        rulesLabel.textColor = TEXT_COLOR
        rulesLabel.numberOfLines = 0
        
        rulesLabel.translatesAutoresizingMaskIntoConstraints = false
        rulesLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        rulesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        rulesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        rulesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        self.backgroundColor = THEME_2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    

}
