//
//  ListViewController.swift
//  Moby
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import SDWebImage

class ExploreViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView = UITableView()
    var bar = BarView()
    var filter = FilterView()
    var defaultBar = DefaultBar()
    var currentLabel:UILabel!
    var barTopLayout:NSLayoutConstraint!
    var margins:UILayoutGuide!
    var lastContentOffset: CGFloat = 0
    var boats:[(MobyBoat,[String])] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.view.addSubview(filter)
        self.view.addSubview(self.tableView)
        self.view.addSubview(bar)
        self.view.addSubview(defaultBar)
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = THEME_1
        
        margins = self.view.layoutMarginsGuide
        filter.isHidden = true
        
        constrainViews()
        setupViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViews(){
        
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
        
        
        tabBar.setup()
        
        
    }
    
    func constrainViews(){
        
        bar.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        bar.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        bar.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.068).isActive = true
        
        tableView.topAnchor.constraint(equalTo: bar.bottomAnchor, constant: -5).isActive = true
        tableView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        tableView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0).isActive = true
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardCell
        
        var url:URL!
        
        if boats[indexPath.row].1.count > 0 {
            
            url = URL(string: boats[indexPath.row].1[0])
            print("cell Image is \(boats[indexPath.row].1[0])")
            cell.bgImageView.sd_setImage(with: url)
        }else {
            
            cell.bgImageView.image = UIImage(named: "bluewhale")
            
        }
        
        let boat = boats[indexPath.row].0
        let number = Int(boat.price!)
        let finalNumber = NumberFormatter.localizedString(from: NSNumber(value: number), number: NumberFormatter.Style.currency)
        
        cell.priceLbl.text = finalNumber
        cell.reviewsLbl.text = "\(reviews[indexPath.row]) Reviews"
        cell.titleLbl.text = boat.title
        cell.stars.rating = stars[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.setNeedsLayout()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.height * 0.5
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = BoatDetailViewController()
        
        controller.boat = boats[indexPath.row]
        
        self.present(controller, animated: true, completion: nil)
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
    
    override var prefersStatusBarHidden: Bool {
        
        return true
    }
    
}
