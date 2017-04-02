//
//  infoBarView.swift
//  Moby
//
//  Created by Jonathan on 4/2/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class infoBarView: UIView {
    
    var icon1 = IconView()
    var icon2 = IconView()
    var icon3 = IconView()
    var icon4 = IconView()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(icon1)
        self.addSubview(icon2)
        self.addSubview(icon3)
        self.addSubview(icon4)
    }
    
    func setup(){
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
