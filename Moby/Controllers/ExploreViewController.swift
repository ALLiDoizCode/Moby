//
//  ListViewController.swift
//  Moby
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material

class ExploreViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView = UITableView()
    var bar = BarView()
    var filter = FilterView()
    var defaultBar = DefaultBar()
    let boats = ["boat_1","boat_2","boat_3","boat_4"]
    let prices = ["850","652","324","514"]
    let reviews = ["50","32","74","14"]
    var currentLabel:UILabel!
    var barTopLayout:NSLayoutConstraint!
    var margins:UILayoutGuide!
    var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        margins = self.view.layoutMarginsGuide
        
        filter.isHidden = true
        self.view.addSubview(filter)
        self.view.addSubview(self.tableView)
        self.view.addSubview(bar)
        self.view.addSubview(defaultBar)
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = THEME_1
        self.tableView.backgroundColor = Color.clear
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = THEME_2
        tableView.isHidden = true
        defaultBar.setup()
        defaultBar.setAnchors()
        defaultSetup()
        
        //bar.setup()
        bar.drawViews(nextView: bar.text1)
        currentLabel = bar.text1
        bar.tap1.addTarget(self, action: #selector(ExploreViewController.tapText1))
        bar.tap2.addTarget(self, action: #selector(ExploreViewController.tapText2))
        bar.tap3.addTarget(self, action: #selector(ExploreViewController.tapText3))
        bar.tap4.addTarget(self, action: #selector(ExploreViewController.tapText4))
        
        filter.upArrow.addTarget(self, action:  #selector(ExploreViewController.defaultBarAnimation), for: .touchUpInside)
        defaultBar.tap1.addTarget(self, action: #selector(ExploreViewController.filterAnimation))
        
        bar.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        bar.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        bar.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.068).isActive = true
        
        tableView.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: -5).isActive = true
        tableView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        tableView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = Color.clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return boats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CardCell
        
        let image = UIImage(named: boats[indexPath.row])
        
        cell.bgImageView.image = image
        cell.priceLbl.text = "$\(prices[indexPath.row])"
        cell.reviewsLbl.text = "\(reviews[indexPath.row]) Reviews"
        cell.titleLbl.text = "Great boat for a day on the river in"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.height * 0.45
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
        
        if (self.lastContentOffset > scrollView.contentOffset.y) {
            // move up
            filterAnimation()
            
        }
        else if (self.lastContentOffset < scrollView.contentOffset.y) {
            // move down
            defaultBarAnimation()
            
        }
        
        // update the new position acquired
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    /*override var prefersStatusBarHidden: Bool {
        
        return true
    }*/
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
