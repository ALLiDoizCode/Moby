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
    var images:[UIImage] = []
    var controller:NewBoatViewController!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(collectionView)
        let image = UIImage(named:"photo")
        images.append(image!)
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
        
        collectionView.minimumLineSpacing = 0
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
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "newBoat", for: indexPath) as! DetailImageCollectionViewCell
        
        cell.boatImage.image = images[indexPath.row]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let currentCell = cell as! DetailImageCollectionViewCell
        
        if indexPath.row == images.count - 1 {
            
            currentCell.imageHeight.isActive = false
            currentCell.imageHeight = currentCell.boatImage.heightAnchor.constraint(equalTo: currentCell.heightAnchor, multiplier: 0.5)
            currentCell.imageHeight.isActive = true
            
            UIView.animate(withDuration: 0.3, animations: {
                
                currentCell.setNeedsDisplay()
            })
            
            currentCell.boatImage.contentMode = .scaleAspectFit
        }else {
            
            currentCell.imageHeight.isActive = false
            currentCell.imageHeight = currentCell.boatImage.heightAnchor.constraint(equalTo: currentCell.heightAnchor, multiplier: 1)
            currentCell.imageHeight.isActive = true
            
            UIView.animate(withDuration: 0.3, animations: {
                
                currentCell.setNeedsDisplay()
            })
            currentCell.boatImage.contentMode = .scaleAspectFill
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        controller.imagePicker.allowsEditing = false
        controller.imagePicker.sourceType = .photoLibrary
        controller.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        controller.present(controller.imagePicker, animated: true, completion: nil)
        
         /*controller.imagePicker.allowsEditing = false
         controller.imagePicker.sourceType = UIImagePickerControllerSourceType.camera
         controller.imagePicker.cameraCaptureMode = .photo
         controller.imagePicker.modalPresentationStyle = .fullScreen
         controller.present( controller.imagePicker,animated: true,completion: nil)*/
    }

}
