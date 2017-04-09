//
//  ProfileViewController.swift
//  Moby
//
//  Created by Jonathan on 4/8/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class ProfileViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    let headerView = UIView()
    
    var titles:[String] = ["Tell friends","Captin mode","Settings","support","Add boat","Leave us feedback"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = THEME_2
        
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        tableView.backgroundColor = THEME_2
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profile")
        // Do any additional setup after loading the view.
        
        let profileImageView = UIImageView()
        let label = UILabel()
        let image = UIImage(named: "guy")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.image = image
        label.font = RobotoFont.bold(with: largeFontWidth)
        label.textColor = TEXT_COLOR
        label.text = "John Doe"
        headerView.addSubview(profileImageView)
        headerView.addSubview(label)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
        profileImageView.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -20).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: self.view.width * 0.25).isActive = true
        profileImageView.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 1).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20).isActive = true
        
    
        
        print("image height is \(profileImageView.frame.height)")
        
        profileImageView.layer.cornerRadius = (self.view.width * 0.25) / 2
        profileImageView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.height * 0.25
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.frame.height * 0.1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! ProfileTableViewCell
        
        cell.label.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.selectionStyle = .none
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
