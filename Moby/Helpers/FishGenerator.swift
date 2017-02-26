//
//  FishGenerator.swift
//  Moby
//
//  Created by Jonathan on 2/26/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import UIKit

func setupFish(view:UIView,completion:@escaping (_ fishes:[UIImageView]) -> Void){
    
    var fisheImages:[UIImageView] = []
    
    DispatchQueue.main.async {
        print("main thread dispatch")
        
        for fish in fishes {
            
            let y = Int(arc4random_uniform(500))
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: y, width: 100, height: 100))
            imageView.image = UIImage(named: fish)
            view.addSubview(imageView)
            
            fisheImages.append(imageView)
        }
        
        completion(fisheImages)
        
    }
}
