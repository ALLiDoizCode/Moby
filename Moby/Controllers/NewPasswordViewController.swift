//
//  NewPasswordViewController.swift
//  Moby
//
//  Created by Jonathan on 4/24/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import CDAlertView
import NVActivityIndicatorView

class NewPasswordViewController: UIViewController,NVActivityIndicatorViewable {
    
    var instructions = UILabel()
    var emailTextField = TextField()
    var cancelBtn = FlatButton()
    var sendBtn = FlatButton()
    var codeId:String!
    var email:String!
    var status:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = THEME_1
        self.view.addSubview(instructions)
        self.view.addSubview(emailTextField)
        self.view.addSubview(sendBtn)
        self.view.addSubview(cancelBtn)
        
        setup()
        constrainViews()
        
        // Do any additional setup after loading the view.
    }
    
    func setup(){
        
        instructions.text = "Enter your email and we'll send you a code to reset your password"
        instructions.font = RobotoFont.bold(with: largeFontWidth)
        instructions.textColor = THEME_2
        instructions.numberOfLines = 0
        
        emailTextField.dividerActiveColor = THEME_2
        emailTextField.placeholder = "Emal Address"
        emailTextField.autocorrectionType = .no
        emailTextField.font = RobotoFont.regular(with: largeFontWidth)
        emailTextField.textColor = THEME_2
        emailTextField.placeholderNormalColor = THEME_2
        
        sendBtn.backgroundColor = Color.clear
        sendBtn.borderColor = THEME_2
        sendBtn.borderWidthPreset = .border2
        sendBtn.setTitle("Send", for: .normal)
        sendBtn.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        sendBtn.addTarget(self, action: #selector(NewPasswordViewController.sendCode), for: .touchUpInside)
        
        cancelBtn.backgroundColor = Color.clear
        cancelBtn.borderColor = THEME_2
        cancelBtn.borderWidthPreset = .border2
        cancelBtn.setTitle("Cancel", for: .normal)
        cancelBtn.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        cancelBtn.addTarget(self, action: #selector(NewPasswordViewController.cancel), for: .touchUpInside)
    }
    
    func constrainViews(){
        
        instructions.translatesAutoresizingMaskIntoConstraints = false
        instructions.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        instructions.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        instructions.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50).isActive = true
        
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: instructions.bottomAnchor, constant: 50).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        sendBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        sendBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        sendBtn.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        sendBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
        
        cancelBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        cancelBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        cancelBtn.topAnchor.constraint(equalTo: sendBtn.bottomAnchor, constant: 20).isActive = true
        cancelBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
    }
    
    func sendCode(){
        
        emailTextField.resignFirstResponder()
        
        let alertEmptyFields = CDAlertView(title: "Fields Can't Be Empty", message: "", type: .notification)
        
        var doneAction:CDAlertViewAction!
        doneAction = CDAlertViewAction(title: "OK 😑",  handler: { (action) in
            
            self.stopAnimating()
            
        })
        alertEmptyFields.add(action: doneAction)
        
        guard emailTextField.text != "" else {
            
            alertEmptyFields.show()
            
            return
        }
        
        startAnimating(self.view.frame.size, message: "", messageFont: RobotoFont.bold(with: largeFontWidth), type: .ballScale , color: THEME_1, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: Color.black.withAlphaComponent(0.6))
        
        guard codeId == nil else {
            
            guard status == true else {
                
                PasswordPresenter().verifyCode(code: emailTextField.text!, codeId: codeId, completion: { (success, message) in
                    
                    guard message == "" else {
                        
                        let alertEmail = CDAlertView(title: "Try again", message: message, type: .notification)
                        alertEmail.add(action: doneAction)
                        alertEmail.show()
                        
                        return
                    }
                    
                    self.stopAnimating()
                    
                    self.instructions.text = "Enter your New Password"
                    self.emailTextField.placeholder = "New Password"
                    self.emailTextField.text = ""
                    self.emailTextField.isSecureTextEntry = true
                    self.sendBtn.setTitle("Save", for: .normal)
                    self.status = true
                    
                })
                
                return
            }

            PasswordPresenter().setPassword(password: self.emailTextField.text!, email: self.email, completion: { (success, message) in
                
                guard message == "" else {
                    
                    let alertEmail = CDAlertView(title: "Try again", message: message, type: .notification)
                    alertEmail.add(action: doneAction)
                    alertEmail.show()
                    
                    return
                }
                
                let saveAction:CDAlertViewAction!
                saveAction = CDAlertViewAction(title: "OK",  handler: { (action) in
                    
                    self.stopAnimating()
                    self.navigationController?.popViewController(animated: true)
                })
                
                let alertSave = CDAlertView(title: "Success", message: "Password Saved", type: .notification)
                alertSave.add(action: saveAction)
                alertSave.show()
            })
            
            return
        }
        
        PasswordPresenter().getCode(email: emailTextField.text!) { (codeId,message) in
            
            
            guard message == "" else {
                
                let alertEmail = CDAlertView(title: message, message: "", type: .notification)
                alertEmail.add(action: doneAction)
                alertEmail.show()
                
                return
            }
            
            self.stopAnimating()
            
            self.codeId = codeId
            self.email = self.emailTextField.text!
            self.instructions.text = "Enter the 5 digit code you recieved in your email"
            self.emailTextField.placeholder = "Enter Code Here"
            self.emailTextField.text = ""
            self.sendBtn.setTitle("Verify", for: .normal)
            
        }
    }
    
    func cancel(){
        
        guard codeId == nil else {
            
            startAnimating(self.view.frame.size, message: "", messageFont: RobotoFont.bold(with: largeFontWidth), type: .ballScale , color: THEME_1, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: Color.black.withAlphaComponent(0.6))
            
            PasswordPresenter().verifyCode(code: "", codeId: codeId, completion: { (success, message) in
                

                self.stopAnimating()
                self.navigationController?.popViewController(animated: true)
            })
            
            return
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
