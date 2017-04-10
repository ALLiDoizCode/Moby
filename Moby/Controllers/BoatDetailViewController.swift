//
//  BoatDetailViewController.swift
//  Moby
//
//  Created by Jonathan on 4/2/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import CenteredCollectionView
import Material
import SDWebImage

class BoatDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView = CenteredCollectionView()
    var scrollView = UIScrollView()
    var titleView = TitleView()
    var itemBar = TabBar()
    var backButton = FlatButton()
    var about = AboutView()
    var aboutHeight:NSLayoutConstraint!
    var map = mapView()
    let container = UIView()
    var timeBar = TabBar()
    var depatureTime = UILabel()
    var featuredReiview = FeaturedReview()
    var payTab = PayTabView()
    var boat:(MobyBoat,[String])!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = THEME_2
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register collection cells
        collectionView.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: "detail")
        
        // configure centeredCollectionView properties
        collectionView.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.45)
        
        // get rid of scrolling indicators
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.minimumLineSpacing = 0
        collectionView.scrollDirection = .horizontal
        scrollView.frame = self.view.frame

        self.view.addSubview(scrollView)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(titleView)
        scrollView.addSubview(itemBar)
        scrollView.addSubview(backButton)
        scrollView.addSubview(about)
        scrollView.addSubview(map)
        scrollView.addSubview(timeBar)
        scrollView.addSubview(depatureTime)
        scrollView.addSubview(featuredReiview)
        self.view.addSubview(payTab)
        
        setup()
        constrainViews()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func gotoReviews(){
        
        let controller = ReviewViewController()
        
        self.present(controller, animated: true) {
            
        }
    }
    
    func constrainViews(){
                
        let margins = self.view.layoutMarginsGuide
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: margins.topAnchor, constant: -10).isActive = true
        scrollView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        scrollView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        scrollView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.9).isActive = true
        //scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true*/
        
        payTab.translatesAutoresizingMaskIntoConstraints = false
        payTab.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
        payTab.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        payTab.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        //payTab.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.10).isActive = true
        payTab.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        //scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true*/
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0).isActive = true
        //collectionView.bottomAnchor.constraint(equalTo: titleView.topAnchor, constant: -10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.45).isActive = true
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
        //titleView.bottomAnchor.constraint(equalTo: itemBar.topAnchor, constant: 0).isActive = true
        titleView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        titleView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        titleView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.25).isActive = true
        
        itemBar.translatesAutoresizingMaskIntoConstraints = false
        itemBar.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 0).isActive = true
        //itemBar.bottomAnchor.constraint(equalTo: about.topAnchor, constant: 0).isActive = true
        itemBar.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -21).isActive = true
        itemBar.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 21).isActive = true
        itemBar.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.12).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30).isActive = true
        backButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.03).isActive = true
        backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor, multiplier: 1).isActive = true
        
        about.translatesAutoresizingMaskIntoConstraints = false
        about.topAnchor.constraint(equalTo: itemBar.bottomAnchor, constant: 0).isActive = true
        aboutHeight = about.bottomAnchor.constraint(equalTo: about.more.bottomAnchor, constant: 0)
        about.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        about.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        //aboutHeight = about.heightAnchor.constraint(equalTo: about.body.heightAnchor, multiplier: 1)
        aboutHeight.isActive = true
        
        timeBar.translatesAutoresizingMaskIntoConstraints = false
        timeBar.topAnchor.constraint(equalTo: about.bottomAnchor, constant: 0).isActive = true
        timeBar.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        timeBar.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        timeBar.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.12).isActive = true
        //timeBar.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        map.translatesAutoresizingMaskIntoConstraints = false
        map.topAnchor.constraint(equalTo: timeBar.bottomAnchor, constant: 0).isActive = true
        map.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        map.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        map.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.45).isActive = true
        //map.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        depatureTime.translatesAutoresizingMaskIntoConstraints = false
        depatureTime.topAnchor.constraint(equalTo: map.bottomAnchor, constant: 0).isActive = true
        depatureTime.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 0).isActive = true
        depatureTime.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        depatureTime.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.12).isActive = true
        //depatureTime.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0).isActive = true
        
        featuredReiview.translatesAutoresizingMaskIntoConstraints = false
        featuredReiview.topAnchor.constraint(equalTo: depatureTime.bottomAnchor, constant: 0).isActive = true
        featuredReiview.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        featuredReiview.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        featuredReiview.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        featuredReiview.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.45).isActive = true
       
        
        //self.scrollView.contentSize = CGSize(width: scrollView.frame.width * 2, height: scrollView.frame.height * 2)
        
        self.scrollView.setNeedsLayout()
        self.scrollView.layoutIfNeeded()
        self.scrollView.setNeedsDisplay()
        
        
        let shadow = UIBezierPath(rect: payTab.bounds)
        
        payTab.layer.masksToBounds = false
        payTab.layer.shadowColor = UIColor.black.cgColor
        payTab.layer.shadowOffset = CGSize(width: -15, height: 20)
        payTab.layer.shadowOpacity = 0.4
        payTab.layer.shadowPath = shadow.cgPath
        
        
    }
    
    func readMore(){
        
        guard about.body.numberOfLines == 5 else {
            
            /*aboutHeight.isActive = false
            aboutHeight = about.heightAnchor.constraint(equalTo: about.body.heightAnchor, multiplier: 1.25)
            aboutHeight.isActive = true*/
            
            about.body.numberOfLines = 5
            
            UIView.animate(withDuration: 0.5, animations: {
                
                self.about.setNeedsLayout()
                
            }) { (success) in
                
                self.about.more.setTitle("More", for: .normal)
            }
            
            return
        }
        
        /*aboutHeight.isActive = false
        aboutHeight = about.heightAnchor.constraint(equalTo: about.body.heightAnchor, multiplier: 1.05)
        aboutHeight.isActive = true*/
        
        about.body.numberOfLines = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.about.setNeedsLayout()
            
        }) { (success) in
            
            self.about.more.setTitle("Less", for: .normal)
        }
    }
    
    func setup(){
        
        let profileImage = UIImage(named: "guy")
        var image1:UIImage!
        titleView.profileImage.image = profileImage
        titleView.boatTitle.text = boat.0.title
        titleView.nameLabel.text = "Jonathan Green"
        titleView.subTitle.text = boat.0.tripType
        
        if boat.0.power! == "Sail" {
            
            image1 = UIImage(named: "sail")
            
        }else if boat.0.power! == "Paddle" {
            
            image1 = UIImage(named: "rowing")
            
        }else {
            
            image1 = UIImage(named: "power")
        }
    
        let image2 = UIImage(named: "door")
        let image3 = UIImage(named: "people")
        let image4 = UIImage(named: "tub")
        let image5 = UIImage(named: "year")
        let timeBarImage = UIImage(named: "time")
        let amenities = UIImage(named: "amenities")
        let rules = UIImage(named: "rules")
        
        itemBar.tab1.icon.image = image1
        itemBar.tab1.label.text = boat.0.power!
        
        itemBar.tab2.icon.image = image2
        itemBar.tab2.label.text = "\(boat.0.rooms!) Room"
        
        itemBar.tab3.icon.image = image3
        itemBar.tab3.label.text = "1-\(boat.0.passengers!)"
        
        itemBar.tab4.icon.image = image4
        itemBar.tab4.label.text = "\(boat.0.restRooms!) Bath"
        
        itemBar.tab5.icon.image = image5
        itemBar.tab5.label.text = boat.0.year
        
        timeBar.tab1.label.text = "\(boat.0.minTime!) hour min"
        timeBar.tab1.icon.image = timeBarImage
        timeBar.tab3.label.text = "Amenities"
        timeBar.tab3.icon.image = amenities
        timeBar.tab3.gesture.addTarget(self, action: #selector(BoatDetailViewController.showAmenities))
        timeBar.tab5.label.text = "Rules"
        timeBar.tab5.icon.image =  rules
        timeBar.tab5.gesture.addTarget(self, action: #selector(BoatDetailViewController.showRules))
        
        timeBar.tab2.isHidden = true
        timeBar.tab4.isHidden = true
        
        depatureTime.text = "Departure 8:00AM"
        depatureTime.textColor = TEXT_COLOR
        depatureTime.font = RobotoFont.light(with: largeFontWidth)
        
        let number = boat.0.price!
        
        payTab.priceLabel.text = "\(number.currency)hr"
        payTab.subLabel.text = "per hour"
        
        featuredReiview.addTarget(self, action: #selector(BoatDetailViewController.gotoReviews), for: .touchUpInside)
        featuredReiview.profileImage.image = profileImage
        featuredReiview.stars.rating = 4.2
        featuredReiview.reviewName.text = "John"
        featuredReiview.more.setTitle("Read all 86", for: .normal)
        featuredReiview.reviewDate.text = "March 2017"
        featuredReiview.body.text = FAKE_REVIEW
        
        backButton.image = UIImage(named: "back")
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(BoatDetailViewController.back), for: .touchUpInside)
        about.more.addTarget(self, action: #selector(BoatDetailViewController.readMore), for: .touchUpInside)
        about.body.text = boat.0.description
        
    }
    
    func showAmenities() {
        
        let controller = AmenitiesViewController()
        self.present(controller, animated: true, completion: nil)
    }
    
    func showRules(){
        
        let controller = AmenitiesViewController()
        self.present(controller, animated: true, completion: nil)
    }
    
    func back(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return boat.1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detail", for: indexPath) as! DetailImageCollectionViewCell
        
        var url:URL!
        
        url = URL(string: boat.1[indexPath.row])
        cell.boatImage.sd_setImage(with: url)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }
    
    
    override var prefersStatusBarHidden: Bool{
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
