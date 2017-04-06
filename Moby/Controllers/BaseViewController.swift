//
//  BaseViewController.swift
//  Moby
//
//  Created by Jonathan on 4/5/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var tabBar = TabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tabBar)
        
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tabBar.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tabBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.08).isActive = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
