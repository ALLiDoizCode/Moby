//
//  ExplorePresenter.swift
//  Moby
//
//  Created by Jonathan on 4/9/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class ExplorePresenter {
    
    func boats(completion:@escaping (_ boats:[(MobyBoat,[String])]) -> Void){
        
        var boats:[(MobyBoat,[String])] = []
        
        // Move to a background thread to do some long running work
        DispatchQueue.global(qos: .userInitiated).sync {
            
            SearchClient().findCollections(collection: BOAT_COLLECTION, search: SearchModel()) { (objects) in
                
                var urls:[String] = []
                
                let boatObjects = objects as! [MobyBoat]
                
                print("we got \(boatObjects.count) boats")
                
                for boat in boatObjects {
                    
                    let query = SearchModel()
                    query.key1 = "boatId"
                    query.value1 = boat.id!
                    
                    print("current boat id is \(boat.id!)")
                    
                    SearchClient().findCollections(collection: IMAGES_COLLECTION, search: query, completion: { (objects) in
                        
                        let boatImageObjects = objects as! [BoatImages]
                        
                        for image in boatImageObjects {
                            
                            print(image.Image)
                            
                            urls.append(image.Image)
                        }
                        
                        boats.append((boat,urls))
                        
                        urls = []
                        
                        if boats.count == boatObjects.count{
                            
                            print("boat count is \(boats.count)")
                            
                            completion(boats)
                        }
                    })
                    
                }
                
            }
        }
        
    }
}


