//
//  PasswordPresenter.swift
//  Moby
//
//  Created by Jonathan on 4/24/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class PasswordPresenter {
    
    func getCode(email:String,completion:@escaping (_ code:String,_ message:String) -> Void){
        
        Client().token { (token) in
            
            Client().auth(token: token, completion: { (true) in
                
                Client().emailIsValid(email: email, completion: { (isValid) in
                    
                    guard isValid == true else {
                        
                        completion("","This Email isn't Valid")
                        
                        return
                    }
                    
                    Client().emailExist(email: email, completion: { (isExist) in
                        
                        guard isExist == true else {
                            
                            completion("","Email Doesn't Exist")
                            
                            return
                        }
                        
                        PasswordClient().getCode(email: email, completion: { (code) in
                            
                            completion(code,"")
                        })
                    })
                })
            })
        }
    }
    
    func verifyCode(code:String,codeId:String,completion:@escaping (_ success:Bool,_ message:String) -> Void){
        
        Client().token { (token) in
            
            Client().auth(token: token, completion: { (true) in
                
                PasswordClient().verifyCode(code: code, userId: codeId, completion: { (success) in
                    
                    guard success == true else {
                        
                     completion(success, "Invalid Code")   
                        
                        return
                    }
                    
                    completion(success, "")
                    
                })
            })
        }
    }
    
    func setPassword(password:String,email:String,completion:@escaping (_ success:Bool,_ message:String) -> Void){
        
        Client().token { (token) in
            
            Client().auth(token: token, completion: { (true) in
                
                PasswordClient().setPassword(password: password, email: email, completion: { (success) in
                    
                    guard success == true else {
                        
                        completion(success, "There was an issue changing your password")
                        
                        return
                    }
                    
                    completion(success, "")
                })
            })
        }
    }
}
