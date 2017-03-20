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
    
    let accessKey = "AKIAIGOX2DGD7LBX7I7Q"
    let secretKey = "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"

    func newUser() {
        
        if let img = UIImage(named: "guy") {
            //let data = UIImagePNGRepresentation(img) as Data?
            saveImageDocumentDirectory(image: img, path: "guy.jpg")
            let url = upload(path: "guy.jpg")
            let parameters = [
                "firstName": "Jonathan",
                "lastName": "Green",
                "phone": "5555555555",
                "email": "email@email.com",
                "password": "password",
                "connectId": "test",
                "customerId": "test",
                "rating": 5,
                "active": false,
                "rules": "no rules",
                "url": url,
                
                ] as [String : Any]
            
            
            Alamofire.request("http://192.168.1.153:8080/account/user", method: HTTPMethod.post, parameters: parameters).responseJSON(completionHandler: { (response) in
                
                let json = JSON(data: response.data!)
                
                print("response is \(json)")
            })
        
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
    
    func upload(path:String) -> String{
        

     
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let myurl = docsurl.appendingPathComponent(path)
        
        let credentialsProvider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)
        let configuration = AWSServiceConfiguration(region: AWSRegionType.USWest2, credentialsProvider: credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let url = myurl
        let remoteName = "image"
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
                print("Uploaded to:\(publicURL?.absoluteString)")
            }
            return publicURL?.absoluteString
        }
        
        
        
        
        return""
    }
}
