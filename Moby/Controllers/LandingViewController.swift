//
//  LandingViewController.swift
//  Moby
//
//  Created by Jonathan on 4/10/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class LandingViewController: UIViewController {
    
    var icon = UIImageView()
    var emailTextField = TextField()
    var passwordTextField = TextField()
    var loginBtn = FlatButton()
    var signUpBtn = FlatButton()
    var agreement = FlatButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(icon)
        self.view.addSubview(emailTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginBtn)
        self.view.addSubview(signUpBtn)
        self.view.addSubview(agreement)
        
        self.view.backgroundColor = THEME_1
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
        setup()
        constrainViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        
        let lconImage = UIImage(named: "splash")
        
        icon.image = lconImage
        icon.contentMode = .scaleAspectFit
        
        emailTextField.dividerActiveColor = THEME_2
        emailTextField.placeholder = "Emal Address"
        emailTextField.autocorrectionType = .no
        emailTextField.font = RobotoFont.regular(with: largeFontWidth)
        emailTextField.textColor = THEME_2
        emailTextField.placeholderNormalColor = THEME_2
        passwordTextField.dividerActiveColor = THEME_2
        passwordTextField.placeholder = "Password"
        passwordTextField.placeholderNormalColor = THEME_2
        passwordTextField.font = RobotoFont.regular(with: largeFontWidth)
        passwordTextField.textColor = THEME_2
        passwordTextField.isSecureTextEntry = true
        passwordTextField.autocorrectionType = .no
        
        loginBtn.backgroundColor = Color.clear
        loginBtn.borderColor = THEME_2
        loginBtn.borderWidthPreset = .border2
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        
        signUpBtn.backgroundColor = THEME_2
        signUpBtn.setTitle("Sign Up", for: .normal)
        signUpBtn.setTitleColor(THEME_1, for: .normal)
        signUpBtn.titleLabel?.font = RobotoFont.bold(with: largeFontWidth)
        signUpBtn.addTarget(self, action: #selector(LandingViewController.signUp), for: .touchUpInside)
        
        agreement.setTitle("Terms of Agreement", for: .normal)
        agreement.setTitleColor(THEME_2, for: .normal)
        agreement.titleLabel?.font = RobotoFont.regular(with: fontWidth)
        agreement.pulseOpacity = 0
        
    }
    
    func constrainViews(){
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        icon.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        icon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.6).isActive = true
        icon.heightAnchor.constraint(equalTo: icon.widthAnchor, multiplier: 1).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 20).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 35).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
        
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        loginBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        loginBtn.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30).isActive = true
        loginBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
        
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        signUpBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        signUpBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 20).isActive = true
        signUpBtn.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.10).isActive = true
        
        agreement.translatesAutoresizingMaskIntoConstraints = false
        agreement.topAnchor.constraint(equalTo: signUpBtn.bottomAnchor, constant: 10).isActive = true
        agreement.centerXAnchor.constraint(equalTo: signUpBtn.centerXAnchor, constant: 0).isActive = true
        agreement.widthAnchor.constraint(equalTo: signUpBtn.widthAnchor, multiplier: 1).isActive = true
        agreement.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.02).isActive = true
    }
    
    func signUp(){
        
        let controller = SignUpViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func login(){
        
        guard emailTextField.text != "" else {
            
            return
        }
        
        guard passwordTextField.text != "" else {
            
            return
        }
        
        Client().token { (token) in
            
            DataStore.setToken(ACCESS_TOKEN: token)
            
            Client().auth(token: token) { (success) in
                
                guard success == true else {
                    
                    return
                }
                
                Client().login(email: self.emailTextField.text!, password: self.passwordTextField.text!, completion: {
                    
                    let controller = ExploreViewController()
                    self.navigationController?.pushViewController(controller, animated: true)
                    
                })
            }
        }
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
