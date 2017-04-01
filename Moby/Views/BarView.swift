//
//  BarView.swift
//  Moby
//
//  Created by Jonathan on 4/1/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class BarView: UIView {
    
    var text1 = UILabel()
    var text2 = UILabel()
    var text3 = UILabel()
    var text4 = UILabel()
    var line = UIView()
    var tap1 = UITapGestureRecognizer()
    var tap2 = UITapGestureRecognizer()
    var tap3 = UITapGestureRecognizer()
    var tap4 = UITapGestureRecognizer()
    var lineLeftAnchor:NSLayoutConstraint!
    var lineWidthAnchor:NSLayoutConstraint!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(text1)
        self.addSubview(text2)
        self.addSubview(text3)
        self.addSubview(text4)
        self.addSubview(line)
        
        print("font is \(fontWidth)")
        
        text1.textColor = THEME_2.withAlphaComponent(0.6)
        text1.text = "Charters"
        text1.font = RobotoFont.bold(with: fontWidth)
        text1.textAlignment = .center
        
        text2.textColor = THEME_2.withAlphaComponent(0.6)
        text2.text = "Boats"
        text2.font = RobotoFont.bold(with: fontWidth)
        text2.textAlignment = .center
        
        text3.textColor = THEME_2.withAlphaComponent(0.6)
        text3.text = "Experiences"
        text3.font = RobotoFont.bold(with: fontWidth)
        text3.textAlignment = .center
        
        text4.textColor = THEME_2.withAlphaComponent(0.6)
        text4.text = "Catch"
        text4.font = RobotoFont.bold(with: fontWidth)
        text4.textAlignment = .center
        
        line.backgroundColor = THEME_2
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(){
        
        
    }
    
    func drawViews(nextView:UIView){
        
        let margins = self.layoutMarginsGuide
        
        text1.translatesAutoresizingMaskIntoConstraints = false
        text2.translatesAutoresizingMaskIntoConstraints = false
        text3.translatesAutoresizingMaskIntoConstraints = false
        text4.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        
        text1.textColor = THEME_2.withAlphaComponent(1.0)
        
        text1.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 15).isActive = true
        text1.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        text1.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.15).isActive = true
        text1.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1).isActive = true
        text1.isUserInteractionEnabled = true
        text1.addGestureRecognizer(tap1)
        tap1.numberOfTapsRequired = 1
        
        text2.leftAnchor.constraint(equalTo: text1.rightAnchor, constant: 30).isActive = true
        text2.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        text2.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.1).isActive = true
        text2.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1).isActive = true
        text2.isUserInteractionEnabled = true
        text2.addGestureRecognizer(tap2)
        tap2.numberOfTapsRequired = 1

        text3.leftAnchor.constraint(equalTo: text2.rightAnchor, constant: 30).isActive = true
        text3.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        text3.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.2).isActive = true
        text3.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1).isActive = true
        text3.isUserInteractionEnabled = true
        text3.addGestureRecognizer(tap3)
        tap3.numberOfTapsRequired = 1
      
        text4.leftAnchor.constraint(equalTo: text3.rightAnchor, constant: 30).isActive = true
        text4.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        text4.widthAnchor.constraint(equalTo: margins.widthAnchor, multiplier: 0.1).isActive = true
        text4.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 1).isActive = true
        text4.isUserInteractionEnabled = true
        text4.addGestureRecognizer(tap4)
        tap4.numberOfTapsRequired = 1
        
        line.heightAnchor.constraint(equalToConstant: 2).isActive = true
        line.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 8).isActive = true
        lineLeftAnchor = line.leftAnchor.constraint(equalTo: nextView.leftAnchor, constant: 0)
        lineLeftAnchor.isActive = true
        lineWidthAnchor = line.widthAnchor.constraint(equalTo: nextView.widthAnchor, multiplier: 1)
        lineWidthAnchor.isActive = true
    }
    
}
