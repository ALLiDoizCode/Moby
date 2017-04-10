//
//  ListExtension.swift
//  Moby
//
//  Created by Jonathan on 4/1/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import Foundation
import Material
import NVActivityIndicatorView

extension ExploreViewController {
    
    func setup(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bar.translatesAutoresizingMaskIntoConstraints = false
        filter.translatesAutoresizingMaskIntoConstraints = false
        
        filter.backgroundColor = THEME_1
        
        filter.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        filter.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        filter.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        filter.bottomAnchor.constraint(equalTo: filter.guestBar.bottomAnchor, constant: 0).isActive = true
        
        bar.backgroundColor = THEME_1
        barTopLayout = bar.topAnchor.constraint(equalTo: filter.bottomAnchor, constant: 0)
        barTopLayout.isActive = true
        
       
        
    }
    
    func defaultSetup(){
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        bar.translatesAutoresizingMaskIntoConstraints = false
        defaultBar.translatesAutoresizingMaskIntoConstraints = false
        
        defaultBar.backgroundColor = THEME_1
        
        defaultBar.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        defaultBar.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: -20).isActive = true
        defaultBar.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: 20).isActive = true
        defaultBar.bottomAnchor.constraint(equalTo: defaultBar.bar.bottomAnchor, constant: 0).isActive = true
        
        bar.backgroundColor = THEME_1
        barTopLayout = bar.topAnchor.constraint(equalTo: defaultBar.bottomAnchor, constant: 0)
        barTopLayout.isActive = true
        
        
    }
    
    func tapText1(){
        
        print("text1")
        currentLabel = bar.text1
        barAnimation(nextView: bar.text1)
        tableView.isHidden = true
        
    }
    
    func tapText2(){
        
        startAnimating(self.view.frame.size, message: "Finding Boats", messageFont: RobotoFont.bold(with: largeFontWidth), type: .ballScale , color: THEME_1, padding: 0, displayTimeThreshold: 0, minimumDisplayTime: 0, backgroundColor: Color.black.withAlphaComponent(0.6))
        
        guard DataStore().getBoatList().count == 0 else {
            
            self.boats = DataStore().getBoatList()
            
            DispatchQueue.main.async {
                print("will reload table")
                
                self.currentLabel = self.bar.text2
                self.barAnimation(nextView: self.bar.text2)
                self.tableView.isHidden = false
                self.tableView.reloadData()
                self.stopAnimating()
            }
            
            return
        }
        
        ExplorePresenter().boats { (boats) in
            
            DataStore.setBoatList(boatList: boats)
            self.boats = DataStore().getBoatList()
            
            // Bounce back to the main thread to update the UI
            DispatchQueue.main.async {
                print("will reload table")
                
                self.currentLabel = self.bar.text2
                self.barAnimation(nextView: self.bar.text2)
                self.tableView.isHidden = false
                self.tableView.reloadData()
                self.stopAnimating()
            }
            
        }
       
    }
    
    func tapText3(){
        print("text3")
        currentLabel = bar.text3
        barAnimation(nextView: bar.text3)
        tableView.isHidden = true
    }
    
    func tapText4(){
        print("text4")
        barAnimation(nextView: bar.text4)
        tableView.isHidden = true
    }
    
    func defaultBarAnimation(){
        
        /*for constraints in defaultBar.constraints {
            
            constraints.isActive = false
        }*/
        
        for constraints in filter.constraints {
            
            constraints.isActive = false
        }
        
        barTopLayout.isActive = false
        
        self.defaultBar.setAnchors()
        self.defaultSetup()
        
       
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            
            self.view.layoutIfNeeded()
            
            self.filter.isHidden = true
            self.defaultBar.isHidden = false
        }, completion: { (success) in
            
           
        })
        
    }
    
    func filterAnimation(){
        
        /*for constraints in filter.constraints {
            
            constraints.isActive = false
        }*/
        
        for constraints in defaultBar.constraints {
            
            constraints.isActive = false
        }
        
        barTopLayout.isActive = false
        
        
        self.setup()
        self.filter.setAnchors()
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
         
            self.view.layoutIfNeeded()
            
            self.defaultBar.isHidden = true
            self.filter.isHidden = false
            self.filter.alpha = 1
            
        }, completion: { (success) in
            
            
        })
        
    }
    
    func barAnimation(nextView:UILabel){
        
        bar.lineWidthAnchor.isActive = false
        bar.lineLeftAnchor.isActive = false
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.bar.lineLeftAnchor = self.bar.line.leftAnchor.constraint(equalTo: nextView.leftAnchor, constant: 0)
            self.bar.lineLeftAnchor.isActive = true
            self.bar.lineWidthAnchor = self.bar.line.widthAnchor.constraint(equalTo: nextView.widthAnchor, multiplier: 1)
            self.bar.lineWidthAnchor.isActive = true
            self.bar.text1.textColor = THEME_2.withAlphaComponent(0.6)
            self.bar.text2.textColor = THEME_2.withAlphaComponent(0.6)
            self.bar.text3.textColor = THEME_2.withAlphaComponent(0.6)
            self.bar.text4.textColor = THEME_2.withAlphaComponent(0.6)
            nextView.textColor = THEME_2.withAlphaComponent(1.0)
            self.bar.layoutIfNeeded()
            
        }, completion: nil)
        
    }
}
