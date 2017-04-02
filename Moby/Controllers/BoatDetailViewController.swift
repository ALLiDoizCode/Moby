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

class BoatDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var collectionView = CenteredCollectionView()
    var scrollView = UIScrollView()
    var titleView = TitleView()
    var itemBar = TabBar()
    var backButton = FlatButton()
    
    let boats = ["boat_1","boat_2","boat_3","boat_4","boat_1","boat_2","boat_3","boat_4","boat_1","boat_2","boat_3","boat_4","boat_1","boat_2","boat_3","boat_4","boat_1","boat_2","boat_3","boat_4","boat_1","boat_2","boat_3","boat_4"]

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
        
        collectionView.minimumLineSpacing = 1.0
        collectionView.scrollDirection = .horizontal
        scrollView.frame = self.view.frame
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(collectionView)
        scrollView.addSubview(titleView)
        scrollView.addSubview(itemBar)
        scrollView.addSubview(backButton)
        
        
        constrain()
        setup()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func constrain(){
        
        let margins = self.view.layoutMarginsGuide
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: margins.topAnchor, constant: -10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        collectionView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.45).isActive = true
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0).isActive = true
        titleView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        titleView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        titleView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.25).isActive = true
        
        itemBar.translatesAutoresizingMaskIntoConstraints = false
        itemBar.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 0).isActive = true
        itemBar.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -21).isActive = true
        itemBar.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 21).isActive = true
        itemBar.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.12).isActive = true
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 30).isActive = true
        backButton.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10).isActive = true
        backButton.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.025).isActive = true
        backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor, multiplier: 1).isActive = true
        
        self.scrollView.layoutIfNeeded()
        self.scrollView.setNeedsDisplay()
    }
    
    func setup(){
        
        let profileImage = UIImage(named: "guy")
        
        titleView.profileImage.image = profileImage
        titleView.boatTitle.text = "Great boat for a day on the river in DC!"
        titleView.nameLabel.text = "Jonathan Green"
        titleView.subTitle.text = "Fishing"
        
        let image1 = UIImage(named: "power")
        let image2 = UIImage(named: "door")
        let image3 = UIImage(named: "people")
        let image4 = UIImage(named: "tub")
        let image5 = UIImage(named: "year")
        
        itemBar.tab1.icon.image = image1
        itemBar.tab1.label.text = "Power"
        
        itemBar.tab2.icon.image = image2
        itemBar.tab2.label.text = "1 Room"
        
        itemBar.tab3.icon.image = image3
        itemBar.tab3.label.text = "1-3"
        
        itemBar.tab4.icon.image = image4
        itemBar.tab4.label.text = "1 Bath"
        
        itemBar.tab5.icon.image = image5
        itemBar.tab5.label.text = "2011"
        
        backButton.image = UIImage(named: "back")
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(BoatDetailViewController.back), for: .touchUpInside)
        
    }
    
    func back(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return boats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detail", for: indexPath) as! DetailImageCollectionViewCell
        
        let image = UIImage(named: boats[indexPath.row])
        
        cell.boatImage.image = image
        
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
