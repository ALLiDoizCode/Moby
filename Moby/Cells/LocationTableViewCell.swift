//
//  LocationTableViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class LocationTableViewCell: UITableViewCell {
    
    var name = UILabel()
    var address = UILabel()
    var distance = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = THEME_2
        self.addSubview(name)
        self.addSubview(address)
        //self.addSubview(distance)
        
        constainViews()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        name.textColor = TEXT_COLOR
        name.numberOfLines = 0
        name.font = RobotoFont.bold(with: largeFontWidth - 5)
        
        address.textColor = THEME_1
        address.numberOfLines = 0
        address.font = RobotoFont.regular(with: fontWidth)
        
    }
    
    func constainViews(){
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        name.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        address.translatesAutoresizingMaskIntoConstraints = false
        address.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        address.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        address.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        address.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
