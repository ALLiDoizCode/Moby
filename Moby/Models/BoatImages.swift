//
//  BoatImages.swift
//  Moby
//
//  Created by Jonathan on 3/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation

class BoatImages {
    
    var id:String!
    var boatId:String!
    var main:Bool!
    var Image:String!
    
    init(id:String,boatId:String,main:Bool,Image:String) {
        
        self.id = id
        self.boatId = id
        self.main = main
        self.Image = Image
    }
}
