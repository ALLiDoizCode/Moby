//
//  PictureViews.swift
//  Moby
//
//  Created by Jonathan on 4/7/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import CenteredCollectionView
import Material

class PictureViews: UIView,UICollectionViewDelegate,UICollectionViewDataSource {

    var collectionView = CenteredCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collectionView)
        //setup()
        constrainView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        self.backgroundColor = THEME_2
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(DetailImageCollectionViewCell.self, forCellWithReuseIdentifier: "newBoat")
        
        // configure centeredCollectionView properties
        collectionView.itemSize = CGSize(width: self.frame.width, height: self.frame.height)
        
        // get rid of scrolling indicators
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.minimumLineSpacing = 1.0
        collectionView.scrollDirection = .horizontal
    }
    
    func constrainView(){
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return boats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newBoat", for: indexPath) as! DetailImageCollectionViewCell
        
        let image = UIImage(named: boats[indexPath.row])
        
        cell.boatImage.image = image
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
    }

}
