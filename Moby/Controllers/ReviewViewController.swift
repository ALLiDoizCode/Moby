//
//  ReviewViewController.swift
//  Moby
//
//  Created by Jonathan on 4/4/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class ReviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var reviewHeader = ReviewHeader()
    
    let bodys:[String] = ["I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.","I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.","I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.","I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again.I had another great experience renting from Dmitry. I've booked with Dmitry several times now and he is always great to work with. He has also taught me a lot about boating. I like his Sea Ray 245 a lot -- great features and very well maintained. It turned out to be a nice day for a cruise up and down the Potomac -- to Georgetown, down to Old Town, and some other stops along the way. I can't say enough about how great Dmitry is to work with. I'm looking forward to taking Eureka out again."]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: self.view.frame, style: .grouped)
        self.view.addSubview(tableView)
        tableView.setNeedsLayout()
        tableView.layoutIfNeeded()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "review")
        self.view.backgroundColor = THEME_2
        tableView.backgroundColor = THEME_2
        reviewHeader.backBtn.addTarget(self, action: #selector(ReviewViewController.dimissView), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.frame.height * 0.5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        reviewHeader.reviewTitle.text = "86 Reviews"
        reviewHeader.generalRating .rating = 4.3
        
        reviewHeader.clipsToBounds = true
        reviewHeader.constrain()
        reviewHeader.setup()
        
        return reviewHeader
    }
    
    func dimissView(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bodys.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "review", for: indexPath) as! ReviewTableViewCell
        
        
        cell.body.text = bodys[indexPath.row]
        
        cell.stars.rating = 4.1
        
        let image = UIImage(named: "guy")
        
        cell.profileImage.image = image
        cell.reviewName.text = "John Doe"
        cell.reviewDate.text = "Mach  2017"
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
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
