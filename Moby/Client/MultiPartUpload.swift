//
//  MultiPartUpload.swift
//  Moby
//
//  Created by Jonathan on 3/22/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import UIKit

class MultiPartUpload {
    
    let publicStripe = "pk_test_mZhuo10GuRr7kztp40vrBe8m"

    func UploadRequest()
    {
        let url = URL(string: "https://uploads.stripe.com/v1/files")
        
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        request.addValue("acct_19wKpfKs6yRjebC3", forHTTPHeaderField:"Stripe-Account" )
        request.addValue("Bearer pk_test_mZhuo10GuRr7kztp40vrBe8m", forHTTPHeaderField:"Authorization" )
        
        
        let image = UIImage(named: "test")
        
        if (image == nil)
        {
            return
        }
        
        let image_data = UIImagePNGRepresentation(image!)
        
        
        if(image_data == nil)
        {
            return
        }
        
        
        let body = NSMutableData()
        
        let fname = "test.png"
        let mimetype = "image/png"
        
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"purpose\"\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append("identity_document\r\n".data(using: String.Encoding.utf8)!)
        
        
        
        body.append("--\(boundary)\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Disposition:form-data; name=\"file\"; filename=\"\(fname)\"\r\n".data(using: String.Encoding.utf8)!)
        body.append("Content-Type: \(mimetype)\r\n\r\n".data(using: String.Encoding.utf8)!)
        body.append(image_data!)
        body.append("\r\n".data(using: String.Encoding.utf8)!)
        
        
        body.append("--\(boundary)--\r\n".data(using: String.Encoding.utf8)!)
        
        
        request.httpBody = body as Data
        
        
        
        let session = URLSession.shared
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            
            guard ((data) != nil), let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
            if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            {
                print(dataString)
            }
            
        })
        
        task.resume()
        
        
    }
    
    
    func generateBoundaryString() -> String
    {
        return "Boundary-\(UUID().uuidString)"
    }
}
