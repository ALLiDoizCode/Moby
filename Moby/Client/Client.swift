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
import AWSS3
import AWSCore

class Client {
    
    let awsAccessKey = "AKIAJLNT4NSFWFXFNQAA"
    let awsSecretKey = "76tCyL1lyCGxdZBeg/MPvs1DlAHGBE2mhRwJJtQj"
    
    // Add default headers if needed.(As per your web-service requirement)
    let headers: HTTPHeaders = [
        //"Content-Length": "68",
        "Content-Type" : "application/json"
    ]
    
    func token(completion:@escaping (_ token:String) -> Void){
        
        Alamofire.request("https://mo-b.herokuapp.com/token", method: .get,encoding: JSONEncoding.default).responseString{ (response) in
            
            let json = JSON(response.result.value!).stringValue
            
            print("token is \(json)")
            
            DataStore.setToken(ACCESS_TOKEN: json)
            
            completion(json)
        }
        
    }
    
    func auth(token:String,completion:@escaping (_ success:Bool) -> Void){
            
        let parameters = [
                
                "token": token
                
                ]
            
        Alamofire.request(baseURL(endpoint:"auth"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(response.result.value!).boolValue
            
            print("success is \(json)")
            
            completion(json)
        }
        
    }
    
    func login(email:String,password:String,completion:@escaping (_ Success:Bool,_ message:String) -> Void){
        
        print("email is \(email.lowercased())")
        print("password is \(password)")
        
        let parameters = [
        
            "email": email.lowercased(),
            "password": password
            
            ]
        
        Alamofire.request(baseURL(endpoint:"account/login"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON{ (response) in
            
            print("user response JSON is \(response.result.value)")
            print("response is \(response)")
            print("response degub is \(response.debugDescription)")
            print("response request is \(response.request)")
            print("response reponse is \(response.response)")
            
            
            let json = JSON(response.result.value!)
            
            let message = json["message"].stringValue
            let resultString = json["result"].stringValue
            let success = json["success"].boolValue
            
            print("login success is \(resultString)")
            
            guard success == true else {
                
                completion(success, message)
                
                return
            }
            
            let resultObject = JSON.parse(resultString)
            
            let id = resultObject["_id"].stringValue
            
            
            let accountIssue = "user does not exist or incorrect login credentials"
            
            print("id is \(id)")
            
            guard id != accountIssue else {
                
                print("login issue")
                
                completion(false, id)
                
                return
            }
            
            let connectId = resultObject["connectId"].stringValue
            let customerId = resultObject["customerId"].stringValue
            let email = resultObject["email"].stringValue
            let firstName = resultObject["firstName"].stringValue
            let lastName = resultObject["lastName"].stringValue
            let phone = resultObject["phone"].stringValue
            let profileImage = resultObject["profileImage"].stringValue
            let rating = resultObject["rating"].stringValue
            let isCaptin = resultObject["isCaptin"].boolValue
            
            let fishermen = Fishermen(firstName: firstName, lastName: lastName, image: profileImage, phone: phone, connectId: connectId, customerId: customerId, email: email,rating:rating,isCaptin:isCaptin)
            
            fishermen.id = id
            
            DataStore.setUser(user: fishermen)
            
            completion(true, "login successful")
        }
    }
    
    func newUser(user:Fishermen,password:String,Image:UIImage,card1:String,card2:String,completion:@escaping () -> Void) {
        
        //let data = UIImagePNGRepresentation(img) as Data?
        saveImageDocumentDirectory(image: Image, path: "guy2.jpg")
        let url = upload(path: "guy2.jpg", completion: { (imageUrl) in
            
            var parameters:[String:String] = [:]
            
            parameters["firstName"] = user.firstName!
            parameters["lastName"] = user.lastName!
            parameters["phone"] = user.phone!
            parameters["email"] = user.email!
            parameters["password"] = password
            parameters["rating"] = user.rating!
            parameters["Image"] = imageUrl
            parameters["card1"] = card1
            parameters["card2"] = card2
            parameters["isCaptin"] = "\(user.isCaptin!)"
            
            Alamofire.request(baseURL(endpoint:"account/user"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).responseJSON{ (response) in
                
                print("response is \(response)")
                print("response degub is \(response.debugDescription)")
                print("response request is \(response.request)")
                print("response reponse is \(response.response)")
                
                let json = JSON(response.result.value!)
                
                print("user response JSON is \(json)")
                
                let id = json["id"].stringValue
                let connectId = json["connectId"].stringValue
                let customerId = json["customerId"].stringValue
                let email = json["email"].stringValue
                let firstName = json["firstName"].stringValue
                let lastName = json["lastName"].stringValue
                let phone = json["phone"].stringValue
                let profileImage = json["profileImage"].stringValue
                let rating = json["rating"].stringValue
                let isCaptin = json["isCaptin"].boolValue
                
                let fishermen = Fishermen(firstName: firstName, lastName: lastName, image: profileImage, phone: phone, connectId: connectId, customerId: customerId, email: email,rating:rating,isCaptin:isCaptin)
                
                fishermen.id = id
                
                DataStore.setUser(user: fishermen)
                
                completion()
            }
            
        })
        
        print("works")

    }
    
    func newBoat(boat:MobyBoat,completion:@escaping (_ Id:String) ->Void) {
        
        var parameters:[String:String]! = [:]
        
        parameters["size"] = "\(boat.size!)"
        parameters["type"] = "\(boat.type!)"
        parameters["year"] = "\(boat.year!)"
        parameters["price"] = "\(boat.price!)"
        parameters["passengers"] = "\(boat.passengers!)"
        parameters["location"] = "\(boat.location!)"
        parameters["description"] = "\(boat.description!)"
        parameters["boatModel"] = "\(boat.boatModel!)"
        parameters["boatMake"] = "\(boat.boatMake!)"
        parameters["boatRules"] = "\(boat.boatRules!)"
        parameters["minTime"] = "\(boat.minTime!)"
        parameters["lat"] = "\(boat.lat!)"
        parameters["long"] = "\(boat.long!)"
        parameters["power"] = "\(boat.power!)"
        parameters["restRooms"] = "\(boat.restRooms!)"
        parameters["rooms"] = "\(boat.rooms!)"
        parameters["userId"] = "\(boat.userId!)"
        parameters["title"] = "\(boat.title!)"
        parameters["tripType"] = "\(boat.tripType!)"
        
        Alamofire.request(baseURL(endpoint:"addBoat"), method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: self.headers).responseString { (response) in
            
            //let json = JSON(data: response.data!)
            
            print("new boat response is \(response)")
            
            completion(response.result.value!)
            
        }
    }
    
    func newTrip(captin:String,boat:String,charge:String,duration:String,completion:@escaping (_ Id:String) ->Void) {
        
        let parameters = [
            
            "captin": captin,
            "boat": boat,
            "charge": charge,
            "duration": duration
            
            ]
        
        Alamofire.request("https://mo-b.herokuapp.com/account/addTrip", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseString { (response) in
            
            //let json = JSON(data: response.data!)
            
            print(" new trip response is \(response)")
            
            completion(response.result.value!)
        }
    }
    
    func newCharge(customer:String,charge:String,completion:@escaping (_ Id:String) ->Void) {
        
        let parameters = [
            
            "customer": customer,
            "charge": charge
            
            ]
        
        Alamofire.request("https://mo-b.herokuapp.com/account/addCharge", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseString { (response) in
            
            //let json = JSON(data: response.data!)
            
            print("new charge response is \(response.result.value!)")
            
            completion(response.result.value!)
        }
    }
    
    func newboatImage(boatId:String,image:UIImage,main:Bool,path:String,completion:@escaping (_ Id:String) ->Void) {
        
        let path = "\(path).jpg"
        
        saveImageDocumentDirectory(image: image, path: path)
        
        upload(path: path) { (url) in
            
            let parameters = [
                
                "boatId": boatId,
                "image": url,
                "main":"\(main)"
                
            ]
            
            Alamofire.request("https://mo-b.herokuapp.com/account/addBoatImage", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseString { (response) in
                
                //let json = JSON(data: response.data!)
                
                print("boat iamge id is \(response.result.value!)")
                
                completion(response.result.value!)
            }
        }
    }
    
    /*func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }*/
    
    func saveImageDocumentDirectory(image:UIImage,path:String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(path)
        print(paths)
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
   /* func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func getImage(){
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent("apple.jpg")
        if fileManager.fileExists(atPath: imagePAth){
            self.imageView.image = UIImage(contentsOfFile: imagePAth)
        }else{
            print("No Image")
        }
    }*/
    
    func upload(path:String,completion:@escaping (_ url:String) -> Void){
        
        var urlString = ""
     
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent(path)
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: awsAccessKey, secretKey: awsSecretKey)
        let configuration = AWSServiceConfiguration(region: AWSRegionType.USWest2, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let url = myurl
        let remoteName = path
        let S3BucketName = "mo-b"
        let uploadRequest = AWSS3TransferManagerUploadRequest()!
        uploadRequest.body = url
        uploadRequest.key = remoteName
        uploadRequest.bucket = S3BucketName
        uploadRequest.contentType = "image/jpeg"
        uploadRequest.acl = .publicRead
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(uploadRequest).continueWith { (task) -> Any? in
            
            if let error = task.error {
                print("Upload failed with error: (\(error.localizedDescription))")
            }
            
            if task.result != nil {
                let url = AWSS3.default().configuration.endpoint.url
                let publicURL = url?.appendingPathComponent(uploadRequest.bucket!).appendingPathComponent(uploadRequest.key!)
                urlString = (publicURL?.absoluteString)!
                print("Uploaded to:\(publicURL?.absoluteString)")
            }
            
            completion(urlString)
            
            return urlString
        }
    }
}
