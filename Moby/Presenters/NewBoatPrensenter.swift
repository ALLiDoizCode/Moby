//
//  NewBoatPrensenter.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class NewBoatPrensenter {
    
    func saveBoat(boat:MobyBoat,images:[UIImage],completion:@escaping () -> Void){
        
        Client().auth(token: DataStore().getToken()) { (success) in
            
            guard success == true else {
                
                return
            }
            
            Client().newBoat(boat: boat, completion: { (boatId) in
                
                print("boat completion")
                
                for i in 0..<images.count - 1 {
                    
                    if i == 0 {
                        
                        Client().newboatImage(boatId: boatId, image: images[i], main: true, path: "\(boatId)\(i)", completion: { (boatImageId) in
                            
                            if i == images.count - 2 {
                                print("boom1")
                                completion()
                            }
                        })
                        
                    }else {
                        
                        Client().newboatImage(boatId: boatId, image: images[i], main: true, path: "\(boatId)\(i)", completion: { (boatImageId) in
                            
                            if i == images.count - 2 {
                                print("boom2")
                                completion()
                            }
                        })
                        
                    }
                }
                
            })
        }
    }
}
