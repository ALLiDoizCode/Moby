//
//  UpdateProfileImage.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class UpdateProfileImage: UIView {
    
    let profileImage = UIImageView()
    let updateBtn = FlatButton()
    let backBtn = FlatButton()
    var controller:ProfileViewController!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(profileImage)
        self.addSubview(updateBtn)
        self.addSubview(backBtn)
        
        constrainViews()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(){
        let backImage = UIImage(named: "back2")
        let image = UIImage(named: "user")
        
        backBtn.image = backImage
        backBtn.addTarget(self, action: #selector(UpdateProfileImage.back), for: .touchUpInside)
        profileImage.image = image
        profileImage.contentMode = .scaleAspectFill
        updateBtn.backgroundColor = THEME_1
        updateBtn.setTitle("Update", for: .normal)
        updateBtn.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        updateBtn.addTarget(self, action: #selector(UpdateProfileImage.update), for: .touchUpInside)
        
    }
    
    func constrainViews(){
        
        backBtn.translatesAutoresizingMaskIntoConstraints = false
        backBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        backBtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        backBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.1).isActive = true
        backBtn.heightAnchor.constraint(equalTo: backBtn.widthAnchor, multiplier: 1).isActive = true
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        profileImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor, multiplier: 1).isActive = true
        
        updateBtn.translatesAutoresizingMaskIntoConstraints = false
        updateBtn.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        updateBtn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        updateBtn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        updateBtn.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    func back(){
        
        let controller = ProfileViewController()
        self.controller.navigationController?.pushViewController(controller, animated: true)
    }
    
    func update(){
        
        controller.imagePicker.allowsEditing = false
        controller.imagePicker.sourceType = .photoLibrary
        controller.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        controller.present(controller.imagePicker, animated: true, completion: nil)
    }

}
