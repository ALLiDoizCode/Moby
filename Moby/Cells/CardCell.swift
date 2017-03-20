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
    
    var card: PresenterCard!
    
    /// Conent area.
    fileprivate var presenterView: UIImageView!
    fileprivate var mainLabel: UILabel!
    var priceLbl = UILabel()
    var priceView = UIView()
    
    /// Bottom Bar views.
    fileprivate var bottomBar: Bar!
    fileprivate var dateFormatter: DateFormatter!
    fileprivate var dateLabel: UILabel!
    fileprivate var favoriteButton: IconButton!
    fileprivate var shareButton: IconButton!
    var profileBtn = IconButton()
    
    /// Toolbar views.
    fileprivate var toolbar: Toolbar!
    fileprivate var moreButton: IconButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = Color.clear
        
        preparePresenterView()
        prepareDateFormatter()
        prepareDateLabel()
        prepareFavoriteButton()
        prepareShareButton()
        prepareMoreButton()
        prepareToolbar()
        prepareContentView()
        prepareBottomBar()
        preparePresenterCard()
        prepareProifleImage()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func preparePrice() {
        
        self.card.addSubview(priceView)
        self.priceView.addSubview(priceLbl)
        
        priceView.backgroundColor = Color.grey.darken3.withAlphaComponent(0.6)
        
        priceLbl.textAlignment = .center
        priceLbl.font = RobotoFont.bold(with: 17)
        priceLbl.textColor = Color.grey.lighten5
        priceLbl.text = "$500"
        
    }
    
    
    fileprivate func prepareProifleImage(){
        
        let userImage = UIImage(named: "guy")
        profileBtn.imageView?.contentMode = .scaleAspectFill
        profileBtn.shapePreset = .circle
        profileBtn.clipsToBounds = true
        //profileBtn.borderColor = UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0)
        //profileBtn.borderWidthPreset = .border4
        profileBtn.setImage(userImage, for: .normal)
    }
    
    fileprivate func preparePresenterView() {
        presenterView = UIImageView()
        presenterView.image = UIImage(named: "pattern")?.resize(toWidth: self.width)
        presenterView.contentMode = .scaleAspectFill
    }
    
    fileprivate func prepareDateFormatter() {
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
    }
    fileprivate func prepareDateLabel() {
        dateLabel = UILabel()
        dateLabel.font = RobotoFont.regular(with: 12)
        dateLabel.textColor = Color.blueGrey.base
        dateLabel.textAlignment = .left
        dateLabel.text = "John Smith"
    }
    
    fileprivate func prepareFavoriteButton() {
        favoriteButton = IconButton(image: Icon.favorite, tintColor: Color.red.base)
    }
    
    fileprivate func prepareShareButton() {
        shareButton = IconButton(image: Icon.cm.share, tintColor: Color.blueGrey.base)
    }
    
    fileprivate func prepareMoreButton() {
        moreButton = IconButton(image: Icon.cm.moreHorizontal, tintColor: Color.blueGrey.base)
    }
    
    fileprivate func prepareToolbar() {
        toolbar = Toolbar(rightViews: [moreButton])
        
        toolbar.title = "Material"
        toolbar.titleLabel.textAlignment = .left
        
        toolbar.detail = "Build Beautiful Software"
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.blueGrey.base
    }
    
    fileprivate func prepareContentView() {
        mainLabel = UILabel()
        mainLabel.numberOfLines = 0
        mainLabel.text = "Material is an animation and graphics framework that is used to create beautiful applications."
        mainLabel.font = RobotoFont.regular(with: 14)
    }
    
    fileprivate func prepareBottomBar() {
        bottomBar = Bar(leftViews: [profileBtn], rightViews: [shareButton], centerViews: [])
    }
    
    fileprivate func preparePresenterCard() {
        card = PresenterCard()
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .wideRectangle2
        
        let image = UIImage(named: "placeholderBoat")
        
        presenterView.image = image
        
        card.presenterView = presenterView
        card.contentView = mainLabel
        card.contentViewEdgeInsetsPreset = .wideRectangle2
        card.visualLayer.shadowColor = Color.grey.darken3.cgColor
        card.visualLayer.shadowOpacity = 1
        card.visualLayer.shadowOffset = CGSize.zero
        card.visualLayer.shadowRadius = 10
        card.visualLayer.shadowPath = UIBezierPath(rect: card.bounds).cgPath
        card.visualLayer.shouldRasterize = true

        //card.clipsToBounds = true
        card.bottomBar = bottomBar
        card.bottomBarEdgeInsetsPreset = .none
        
        self.addSubview(card)
        preparePrice()
        
        constrain(card,priceView,priceLbl) { (_card,_priceView,_priceLbl) in
            
            _card.top == (_card.superview?.top)!
            _card.bottom == (_card.superview?.bottom)!
            _card.left == (_card.superview?.left)! + 20
            _card.right == (_card.superview?.right)! - 20
            
            _priceView.bottom == (_priceView.superview?.centerY)!
            _priceView.right == (_priceView.superview?.right)!
            _priceView.width == (_priceView.superview?.width)! * 0.3
            _priceView.height == _priceView.width / 2
            
            _priceLbl.center == (_priceLbl.superview?.center)!
            _priceLbl.height == (_priceLbl.superview?.height)!
            _priceLbl.width == (_priceLbl.superview?.width)!
        }
        
    
        
        //self.layout(card).horizontally(left: 20, right: 20).center()
    }

}

