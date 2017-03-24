//
//  StripeClient.swift
//  Moby
//
//  Created by Jonathan on 3/22/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftEventBus
import SwiftyJSON
import SwiftHTTP

class StripeClient {
    
    let headers: HTTPHeaders = [
        
        "Content-Type" : "application/json"
    ]
    
    /*func customer(email:String,token:String,completion:@escaping (_ id:String) -> Void){
        
        let parameters = [
            
            "email": email,
            "token": token
            
        ]
        
        Alamofire.request("https://mo-b.herokuapp.com/stripe/customer", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(response.result.value as Any)
            
            print("customer response is \(json)")
            completion("")
        }
        
    }
    
    func connectAccount(email:String,firstName:String,lastName:String,token:String,completion:@escaping (_ id:String) -> Void){
        
        let parameters = [
            "email":email,
            "firstName": firstName,
            "lastName": lastName,
            "card":token
        ]
        
        /*var json:JSON!
        var theResponse:Response!
    
        do {
            let opt = try HTTP.POST("https://mo-b.herokuapp.com/stripe/connect", parameters: parameters)
            opt.start { response in
                //do things...
                
                json = JSON(data: response.data)
                theResponse = response
                
                print("connectAccount json is \(response.error)")
                print("connectAccount response is \(theResponse.text)")
                print("connectAccount json is \(json)")
            }
        } catch let error {
            print("got an error creating the request: \(error)")
        }*/
        
        
        Alamofire.request("https://mo-b.herokuapp.com/stripe/connect", method: .post, parameters: parameters).response{ (response) in
            
            let json = JSON(response.data)
            
            print("connectAccount response is \(response)")
            print("connectAccount json is \(json)")
            
            completion("")
            
        }
    }*/
    
    func bankToken(client_id:String,secret:String,public_token:String,accountId:String){
        
        let parameters = [
            "client_id": client_id,
            "secret": secret,
            "public_token":public_token
        ]
        
        Alamofire.request("https://sandbox.plaid.com/item/public_token/exchange", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
        
            let json = JSON(response.result.value!)
            
            let accessToken = json["access_token"].stringValue
            
            print("response is \(response)")
            print("json is \(json)")
            print("access token is \(accessToken)")
            
            let parameters2 = [
                "client_id": client_id,
                "secret": secret,
                "access_token":accessToken,
                "account_id":accountId
            ]
            
            Alamofire.request("https://sandbox.plaid.com/processor/stripe/bank_account_token/create", method: .post, parameters: parameters2, encoding: JSONEncoding.default, headers: self.headers).validate().responseJSON { (response) in
                
                let json = JSON(response.result.value!)
                
                let banktoken = json["stripe_bank_account_token"].stringValue
                
                print("response is \(response)")
                print("json is \(json)")
                print("bank token is \(banktoken)")
                
                
                
            }
            
        }
    }
    
    func charge(customer:String,account:String,amount:String){
        
        let parameters = [
            "customer": customer,
            "account": account,
            "amount":amount
        ]
        
        Alamofire.request("https://mo-b.herokuapp.com/stripe/charge", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
        }
    }
    
    func refund(charge:String){
        
        let parameters = [
            
            "charge": charge
        ]
        
        Alamofire.request("https://mo-b.herokuapp.com/stripe/refund", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
        }
    }
    
    func transfer(account:String,amount:Int){
        
        let parameters = [
            
            "account": account,
            "amount": "\(amount)"

        ] as [String : Any]
        
        Alamofire.request("https://mo-b.herokuapp.com/stripe/transfer", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
        }
    }
    
    func identity(fileId:String,account:String){
        
        let parameters = [
            
            "fileId": fileId,
            "account": account
        
        ]
        
        Alamofire.request("https://mo-b.herokuapp.com/stripe/identity", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
        }
    }
}
