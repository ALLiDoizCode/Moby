//
//  AmenitiesViewController.swift
//  Moby
//
//  Created by Jonathan on 4/5/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class AmenitiesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var headerView = UIView()
    var headerLabel = UILabel()
    var backButton = FlatButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.register(AmenitiesTableViewCell.self, forCellReuseIdentifier: "amenities")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        headerView.addSubview(headerLabel)
        headerView.addSubview(backButton)
        
        headerLabel.text = "Amenities"
        headerLabel.font = RobotoFont.medium(with: largeFontWidth - 5)
        headerLabel.textColor = TEXT_COLOR
        headerView.backgroundColor = THEME_2
        let backImage = UIImage(named: "back2")
        backButton.image = backImage
        backButton.imageView?.contentMode = .scaleAspectFill
        backButton.addTarget(self, action: #selector(AmenitiesViewController.back), for: .touchUpInside)
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        headerLabel.widthAnchor.constraint(equalTo: headerView.widthAnchor, multiplier: 0.8).isActive = true
        headerLabel.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.8).isActive = true
        headerLabel.textAlignment = .center
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20).isActive = true
        backButton.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20).isActive = true
        backButton.heightAnchor.constraint(equalTo: headerView.heightAnchor, multiplier: 0.2).isActive = true
        backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor, multiplier: 1).isActive = true

        // Do any additional setup after loading the view.
    }
    
    func back(){
        
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "amenities", for: indexPath) as! AmenitiesTableViewCell
        
        cell.textLabel?.font = RobotoFont.medium(with: largeFontWidth)
        cell.textLabel?.text = "Food"
        cell.textLabel?.textColor = TEXT_COLOR
        
        return cell
    }
    
    
    override var prefersStatusBarHidden: Bool {
        
        return true
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
