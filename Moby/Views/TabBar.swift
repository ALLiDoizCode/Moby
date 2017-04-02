//
//  TabBar.swift
//  Moby
//
//  Created by Jonathan on 4/1/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class TabBar: UIView {
    
    var tab1 = IconView()
    var tab2 = IconView()
    var tab3 = IconView()
    var tab4 = IconView()
    var tab5 = IconView()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("init tababr")
        
        self.addSubview(tab1)
        self.addSubview(tab2)
        self.addSubview(tab3)
        self.addSubview(tab4)
        self.addSubview(tab5)
        
        tab1.isUserInteractionEnabled = true
        tab2.isUserInteractionEnabled = true
        tab3.isUserInteractionEnabled = true
        tab4.isUserInteractionEnabled = true
        tab5.isUserInteractionEnabled = true
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        self.backgroundColor = THEME_2
        self.borderColor = TEXT_COLOR
        self.borderWidth = 0.5
        
        let margins = self.layoutMarginsGuide
        
        tab1.translatesAutoresizingMaskIntoConstraints = false
        tab1.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
        tab1.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tab1.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        tab1.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.2).isActive = true
        //tab1.backgroundColor = Color.red
        
        tab2.translatesAutoresizingMaskIntoConstraints = false
        tab2.leftAnchor.constraint(equalTo: tab1.rightAnchor, constant: 0).isActive = true
        tab2.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tab2.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        tab2.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.2).isActive = true
        //tab2.backgroundColor = Color.green
        
        tab3.translatesAutoresizingMaskIntoConstraints = false
        tab3.leftAnchor.constraint(equalTo: tab2.rightAnchor, constant: 0).isActive = true
        tab3.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tab3.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        tab3.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.2).isActive = true
        //tab3.backgroundColor = Color.yellow
        
        tab4.translatesAutoresizingMaskIntoConstraints = false
        tab4.leftAnchor.constraint(equalTo: tab3.rightAnchor, constant: 0).isActive = true
        tab4.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tab4.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        tab4.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.2).isActive = true
        //tab4.backgroundColor = Color.blue
        
        tab5.translatesAutoresizingMaskIntoConstraints = false
        tab5.leftAnchor.constraint(equalTo: tab4.rightAnchor, constant: 0).isActive = true
        tab5.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        tab5.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        tab5.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.2).isActive = true
        //tab5.backgroundColor = Color.red
        
        self.setNeedsLayout()
        self.setNeedsDisplay()

    }

}
