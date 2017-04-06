//
//  AmenitiesTableViewCell.swift
//  Moby
//
//  Created by Jonathan on 4/5/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class AmenitiesTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
