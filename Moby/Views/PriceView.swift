//
//  PriceView.swift
//  Moby
//
//  Created by Jonathan on 4/6/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class PriceView: UIView,UITextFieldDelegate {

    var dollar = UIImageView()
    var textfield = TextField()
    var priceDescription = UILabel()
    var doneButton = FlatButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(dollar)
        self.addSubview(textfield)
        self.addSubview(priceDescription)
        self.addSubview(doneButton)
        
        self.backgroundColor = THEME_2
        setup()
        constrainView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case textfield:
            if ((textField.text?.characters.count)! + (string.characters.count - range.length)) > 4 {
                return false
            }
            
        default:
            break
        }
        return true
    }
    
    func setup(){
        
        let font:CGFloat = UIScreen.main.bounds.width * 0.25
        
        let image = UIImage(named: "money")
        dollar.image = image
        dollar.contentMode = .scaleAspectFit
        
        textfield.textColor = THEME_1
        textfield.dividerActiveColor = UIColor.clear
        textfield.dividerNormalColor = UIColor.clear
        textfield.font = RobotoFont.bold(with: font)
        textfield.keyboardType = .numberPad
        textfield.delegate = self
        
        priceDescription.textColor = TEXT_COLOR
        priceDescription.font = RobotoFont.regular(with: largeFontWidth)
        priceDescription.text = "This will be your hourly rate"
        priceDescription.numberOfLines = 0
        
        doneButton.backgroundColor = THEME_1
        doneButton.setTitle("Set Price", for: .normal)
        
    }
    
    func constrainView(){
        
        dollar.translatesAutoresizingMaskIntoConstraints = false
        dollar.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        dollar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        dollar.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.20).isActive = true
        dollar.widthAnchor.constraint(equalTo: dollar.heightAnchor, multiplier: 1).isActive = true
        
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.leftAnchor.constraint(equalTo: dollar.rightAnchor, constant: 0).isActive = true
        textfield.centerYAnchor.constraint(equalTo: dollar.centerYAnchor, constant: 0).isActive = true
        textfield.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6).isActive = true
        textfield.heightAnchor.constraint(equalTo: dollar.heightAnchor, multiplier: 1.1).isActive = true
        
        priceDescription.translatesAutoresizingMaskIntoConstraints = false
        priceDescription.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 50).isActive = true
        priceDescription.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        priceDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.topAnchor.constraint(equalTo: priceDescription.bottomAnchor, constant: 20).isActive = true
        doneButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        doneButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        doneButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2).isActive = true

    
    }

}
