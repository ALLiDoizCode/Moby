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
    
    let awsAccessKey = "AKIAIGOX2DGD7LBX7I7Q"
    let awsSecretKey = "UyTAGhTZ35hKcyP8pyqkf0oDK7LCcJK1uCLFbhv2"
    
    // Add default headers if needed.(As per your web-service requirement)
    let headers: HTTPHeaders = [
        "Accept": "text/html",
        "Content-Type" : "application/x-www-form-urlencoded"
    ]

    
    func token(){
        
        Alamofire.request("https://mo-b.herokuapp.com/token", method: .get,encoding: JSONEncoding.default).responseString{ (response) in
            
            let json = JSON(response.result.value!).stringValue
            
            self.auth(token:json )
            
            print("token is \(json)")
            
        }
        
    }
    
    func auth(token:String){
            
        let parameters = [
                
                "token": token
                
                ]
            
        Alamofire.request("https://mo-b.herokuapp.com/auth", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseString { (response) in
            
            let json = JSON(response.result.value!).boolValue
            
            print("success is \(json)")
    
        }
        
    }
    
    func newUser() {
        
        if let img = UIImage(named: "guy") {
            //let data = UIImagePNGRepresentation(img) as Data?
            saveImageDocumentDirectory(image: img, path: "guy2.jpg")
            let url = upload(path: "guy2.jpg", completion: { (url) in
                
                let parameters = [
                    "firstName": "Jonathan",
                    "lastName": "Green",
                    "phone": "5555555555",
                    "email": "email@email.com",
                    "password": "password",
                    "connectId": "test",
                    "customerId": "test",
                    "rating": 5.0,
                    "active": true,
                    "rules": "no rules",
                    "Image": url,
                    
                    ] as [String : Any]
                
                Alamofire.request("https://mo-b.herokuapp.com/account/user", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
                    
                    let json = JSON(data: response.data!)
                    
                    print("response is \(response)")
                    
                }
                
            })
            
        }
    }
    
    func newBoat(size:Int,type:String,year:String,price:Int,passengers:String,location:String,description:String,activities:String,boatModel:String,lat:Double,long:Double,userId:String,boatImage:[String]) {
        
        let parameters = [
            "size": size,
            "type": type,
            "year": year,
            "price": price,
            "passengers": passengers,
            "location": location,
            "description": description,
            "activities": activities,
            "boatModel": boatModel,
            "lat": lat,
            "long": long,
            "userId": userId,
            "boatImage": boatImage
            
            ] as [String : Any]
        
        Alamofire.request("https://mo-b.herokuapp.com/account/addBoat", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
        }
    }
    
    func newTrip(captin:String,boat:String,charge:String,duration:Int) {
        
        let parameters = [
            
            "captin": captin,
            "boat": boat,
            "charge": charge,
            "duration": duration
            
            ] as [String : Any]
        
        Alamofire.request("https://mo-b.herokuapp.com/account/addTrip", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
        }
    }
    
    func newCharge(customer:String,charge:String) {
        
        let parameters = [
            
            "captin": customer,
            "charge": charge
            
            ]
        
        Alamofire.request("https://mo-b.herokuapp.com/account/addCharge", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            let json = JSON(data: response.data!)
            
            print("response is \(response)")
            
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
