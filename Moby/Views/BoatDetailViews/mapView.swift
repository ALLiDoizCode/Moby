//
//  mapView.swift
//  Moby
//
//  Created by Jonathan on 4/2/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import MapKit

class mapView: UIView {
    
    var myWindow: UIWindow?
    var map: MKMapView?

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.myWindow = UIWindow(frame: UIScreen.main.bounds)
        self.backgroundColor = THEME_2
        
        self.map = MKMapView(frame: CGRect(x: 0, y: 00, width: (myWindow?.frame.width)!, height: (myWindow?.frame.height)! * 0.45))
        self.addSubview(self.map!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
