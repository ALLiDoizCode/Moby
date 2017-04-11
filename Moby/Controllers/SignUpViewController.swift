//
//  SignUpViewController.swift
//  Moby
//
//  Created by Jonathan on 4/10/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import PhoneNumberKit

class SignUpViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var profileImageView = FlatButton()
    var firstName = TextField()
    var lastName = TextField()
    var email = TextField()
    var password = TextField()
    var phone = PhoneNumberTextField()
    var signUpBtn = FlatButton()
    var profileImage:UIImage!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(profileImageView)
        self.view.addSubview(firstName)
        self.view.addSubview(lastName)
        self.view.addSubview(email)
        self.view.addSubview(password)
        self.view.addSubview(phone)
        self.view.addSubview(signUpBtn)
        
        self.view.backgroundColor = THEME_1
        self.navigationController?.isNavigationBarHidden = true
        imagePicker.delegate = self
        
        setup()
        constrainViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        
        profileImage = UIImage(named: "user")
        
        profileImageView.image = profileImage
        profileImageView.imageView?.contentMode = .scaleAspectFill
        profileImageView.pulseOpacity = 0
        profileImageView.addTarget(self, action: "setImage", for: .touchUpInside)
        
        firstName.dividerActiveColor = THEME_2
        firstName.placeholder = "First Name"
        firstName.autocorrectionType = .no
        firstName.font = RobotoFont.regular(with: largeFontWidth)
        firstName.textColor = THEME_2
        firstName.placeholderNormalColor = THEME_2
        
        lastName.dividerActiveColor = THEME_2
        lastName.placeholder = "Last Name"
        lastName.placeholderNormalColor = THEME_2
        lastName.font = RobotoFont.regular(with: largeFontWidth)
        lastName.textColor = THEME_2
        lastName.autocorrectionType = .no
        
        email.dividerActiveColor = THEME_2
        email.placeholder = "Email Address"
        email.placeholderNormalColor = THEME_2
        email.font = RobotoFont.regular(with: largeFontWidth)
        email.textColor = THEME_2
        email.autocorrectionType = .no
        
        password.dividerActiveColor = THEME_2
        password.placeholder = "Password"
        password.placeholderNormalColor = THEME_2
        password.font = RobotoFont.regular(with: largeFontWidth)
        password.textColor = THEME_2
        password.autocorrectionType = .no
        password.isSecureTextEntry = true
        
        //phone.dividerActiveColor = THEME_2
        phone.placeholder = "Phone Number"
        //phone.placeholderNormalColor = THEME_2
        phone.font = RobotoFont.regular(with: largeFontWidth)
        phone.textColor = THEME_2
        phone.autocorrectionType = .no
        
        signUpBtn.backgroundColor = THEME_2
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.setTitleColor(THEME_1, for: .normal)
        signUpBtn.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        signUpBtn.addTarget(self, action: #selector(LandingViewController.signUp), for: .touchUpInside)
    }
    
    func constrainViews(){
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.3).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 1).isActive = true
        
        firstName.translatesAutoresizingMaskIntoConstraints = false
        firstName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        firstName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        firstName.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30).isActive = true
        firstName.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        lastName.translatesAutoresizingMaskIntoConstraints = false
        lastName.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        lastName.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        lastName.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 35).isActive = true
        lastName.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        email.translatesAutoresizingMaskIntoConstraints = false
        email.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        email.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        email.topAnchor.constraint(equalTo: lastName.bottomAnchor, constant: 35).isActive = true
        email.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        password.translatesAutoresizingMaskIntoConstraints = false
        password.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        password.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        password.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 35).isActive = true
        password.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        phone.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        phone.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 35).isActive = true
        phone.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        signUpBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        signUpBtn.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 20).isActive = true
        signUpBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
    }
    
    func setImage(){
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(imagePicker, animated: true, completion: nil)
    }
    
    func signUp(){
        
        let phoneNumberKit = PhoneNumberKit()
        
        var phoneNumber:PhoneNumber!
        
        guard profileImageView.image != profileImage else {
            
            return
        }
        
        guard firstName.text != "" else {
            
            return
        }
        
        guard lastName.text != "" else {
            
            return
        }
        
        guard email.text != "" else {
            
            return
        }
        
        guard password.text != "" else {
            
            return
        }
        
        guard phone.text != "" else {
            
            return
        }
        
        guard phone.isValidNumber == true else {
            
            print("bad phone number")
            
            return
        }
        
        
        let newUser = Fishermen(firstName: firstName.text!, lastName: lastName.text!, image: "", phone: phone.text!, connectId: "", customerId: "", email: email.text!, rating: "0.0", isCaptin: false)
    
        newUser.rawImage = profileImageView.image
        
        let controller = ScanCardViewController()
        
        controller.password = password.text
        controller.newUser = newUser
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
       
        profileImageView.image = chosenImage
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.layer.masksToBounds = true
        
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated:true, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
