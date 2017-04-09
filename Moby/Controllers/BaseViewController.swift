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
        
        let profileImage = UIImage(named: "people")
        tabBar.tab5.icon.image = profileImage
        tabBar.tab5.label.text = "Profile"
        tabBar.tab5.gesture.addTarget(self, action: #selector(BaseViewController.profile))
        
        let chatImage = UIImage(named: "chat")
        tabBar.tab4.icon.image = chatImage
        tabBar.tab4.label.text = "Chat"
        
        let blueWhaleImage = UIImage(named: "bluewhale")
        tabBar.tab3.icon.image = blueWhaleImage
        tabBar.tab3.label.text = "Trips"
        
        let experienceImage = UIImage(named: "telescope")
        tabBar.tab1.icon.image = experienceImage
        tabBar.tab1.label.text = "ARRR"
        tabBar.tab1.gesture.addTarget(self, action: #selector(BaseViewController.explore))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func explore()  {
        
        let controller = ExploreViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }

    func profile(){
        
        let controller = ProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
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
