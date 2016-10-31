//
//  Client.swift
//  Moby
//
//  Created by Jonathan on 10/27/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftEventBus
import SwiftyJSON
import Braintree

class Client {
    
    var braintreeClient:BTAPIClient?
    
    static let sharedInstance = Client()
    
    func getToken(completion:@escaping () -> Void) {
        
        Alamofire.request("https://moby-server.herokuapp.com/client_token").responseJSON { (response) in
            
            guard let resultJSON = response.result.value else {
                
                print("Issue getting token")
                
                return
            }
            
            print("JSON: \(resultJSON)")
            
            let json = JSON(resultJSON)
            
            let token = json["clientToken"].stringValue
            
            self.braintreeClient = BTAPIClient(authorization: token)
            
            completion()
        }
    }
    
    func makeCustomer(firstName:String,lastName:String,email:String,phone:String,completion:@escaping (_ customerId:String) -> Void){
        
        let params = [
            
            "firstName":firstName,
            "lastName":lastName,
            "email":email,
            "phone":phone
        
        ]
        
        Alamofire.request("https://moby-server.herokuapp.com/Customer", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            print("Customer: \(response.result.value)")
            print(response.request)  // original URL request
            print(response.response) // HTTP URL response
            print(response.data)     // server data
            print(response.result)
            
            let json = JSON(response.result.value)
            
            let customerId = json["id"].stringValue
            
            completion(customerId)
            
        }
        
    }
    
    func addCard(){
        
    }
    
    func updateCustomer(){
        
    }
    
    func findCustomer(){
        
    }
    
    func deleteCustomer(){
        
    }
    
    func carge(){
        
    }
    
    func makeCaptin(){
        
    }
    
}
