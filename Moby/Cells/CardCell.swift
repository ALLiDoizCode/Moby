//
//  presentercardViewController.swift
//  Moby
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cartography

class CardCell: TableViewCell {
    
    var bgImageView = UIImageView()
    var likeImageView = UIImageView()
    var favButton = FlatButton()
    var priceLbl = UILabel()
    var titleLbl = UILabel()
    var reviewsLbl = UILabel()
    var fontWidth:CGFloat!
    var views:[UIView]!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = Color.clear
        self.addSubview(bgImageView)
        self.addSubview(favButton)
        self.addSubview(priceLbl)
        self.addSubview(titleLbl)
        self.addSubview(reviewsLbl)
        favButton.addSubview(likeImageView)
        //favButton.isHidden = true
        
        fontWidth = self.frame.width * 0.05
        
        views = [bgImageView,favButton,priceLbl,titleLbl,reviewsLbl,likeImageView]
        
        setupViews()
        
        constrain(views) { (_views) in
            
            let top = (_views[0].superview?.top)!
            let bottom = (_views[0].superview?.bottom)!
            let left = (_views[0].superview?.left)!
            let right = (_views[0].superview?.right)!
            let width = (_views[0].superview?.width)!
            let height = (_views[0].superview?.height)!
            let center = (_views[0].superview?.center)!
            let centerX = (_views[0].superview?.centerX)!
            let centerY = (_views[0].superview?.centerY)!
            
            _views[4].right == right
            _views[4].left == _views[0].left
            _views[4].bottom == bottom
            
            _views[1].top == _views[0].top + 15
            _views[1].right == _views[0].right - 15
            _views[1].width == width * 0.08
            _views[1].height == _views[1].width
            
            _views[2].width == width * 0.1
            _views[2].left == _views[0].left
            _views[2].bottom == _views[4].top
            
            _views[3].right == right
            _views[3].left == _views[2].right
            _views[3].bottom == _views[2].bottom
            
            _views[0].width == width * 0.88
            _views[0].centerX == centerX
            _views[0].top == top + 35
            _views[0].bottom == _views[2].top - 12
            
            _views[5].center == (_views[5].superview?.center)!
            _views[5].height == (_views[5].superview?.height)! * 0.7
            _views[5].width == _views[5].height
        }
        
    }
    
    func setupViews(){
        
        let likeImage = UIImage(named:"like")
       
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.clipsToBounds = true
        likeImageView.contentMode = .scaleAspectFit
        likeImageView.image = likeImage
        favButton.backgroundColor = Color.clear
        priceLbl.textColor = Color.grey.darken2
        priceLbl.font = RobotoFont.bold(with: fontWidth)
        titleLbl.textColor = Color.grey.darken2
        titleLbl.font = RobotoFont.regular(with: fontWidth)
        reviewsLbl.textColor = Color.grey.darken2
        reviewsLbl.font = RobotoFont.regular(with: fontWidth/1.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}

