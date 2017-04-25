//
//  PasswordClient.swift
//  Moby
//
//  Created by Jonathan on 4/24/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftEventBus
import SwiftyJSON

class PasswordClient {
    
    let headers: HTTPHeaders = [
        //"Content-Length": "68",
        "Content-Type" : "application/json"
    ]
    
    func getCode(email:String,completion:@escaping (_ success:String) -> Void){
        
        let parameters = [
            
            "email": email,
            "name": ""
            
        ]
        
        Alamofire.request(baseURL(endpoint:"account/resetPassword"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
            
            print("success is \(response.result.value!)")
            
            //let json = JSON(response.result.value!).stringValue
            
            completion(response.result.value!)
        }
        
    }
    
    func verifyCode(code:String,userId:String,completion:@escaping (_ success:Bool) -> Void){
        
        let parameters = [
            
            "code": code,
            "userId": userId
            
        ]
        
        Alamofire.request(baseURL(endpoint:"water/verifyCode"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
            
            print("success is \(response.result.value!)")
            
            //let json = JSON(response.result.value!).stringValue
            
            completion(Bool(response.result.value!)!)
        }
        
    }
    
    func setPassword(password:String,email:String,completion:@escaping (_ success:Bool) -> Void){
        
        let parameters = [
            
            "password": password,
            "email": email
            
        ]
        
        Alamofire.request(baseURL(endpoint:"water/setPassword"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseString { (response) in
            
            print("password success is \(response.result.value!)")
            
            //let json = JSON(response.result.value!).stringValue
            
            completion(Bool(response.result.value!)!)
        }
        
    }
}
