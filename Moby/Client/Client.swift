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


class Client {

    func upload() {
        
        let image = UIImage(named: "test")!
        
        // define parameters
        let parameters = [
            "purpose": "identity_document",
            
        ]

        
        Alamofire.upload(multipartFormData: { multipartFormData in
            if let imageData = UIImageJPEGRepresentation(image, 1) {
                multipartFormData.append(imageData, withName: "file", fileName: "file.png", mimeType: "image/png")
            }
            
            for (key, value) in parameters {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }}, to: "https://uploads.stripe.com/v1/files", method: .post, headers: ["Authorization": "pk_test_mZhuo10GuRr7kztp40vrBe8m","Stripe-Account":"acct_19u70dBm8zXrVfCJ"],
                encodingCompletion: { encodingResult in
                    switch encodingResult {
                    case .success(let upload, _, _):
                        upload.response { [weak self] response in
                            /*guard let strong Self = self else {
                                return
                            }*/
                            debugPrint(response)
                        }
                    case .failure(let encodingError):
                        print("error:\(encodingError)")
                    }
        })
    }
}
