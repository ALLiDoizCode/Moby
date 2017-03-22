//
//  ListViewController.swift
//  Moby
//
//  Created by Jonathan on 3/19/17.
//  Copyright © 2017 Jonathan. All rights reserved.
//

import UIKit
import Material
import Cartography
import Animo

class ListViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var tableView = UITableView()
    var currentHeight:CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Client().testAuth()
        
        setupFish(view: self.view) { (fishes) in
            
            let yRange = Int(self.view.frame.height)
            
            for fish in fishes {
                
                let startRange = [-100, -80, -60, -115, -125]
                let time = Int(arc4random_uniform(5) + 10)
                let startY = Int(arc4random_uniform(UInt32(yRange)) + 10)
                let endY = Int(arc4random_uniform(UInt32(yRange)) + 10)
                let ran = Int(arc4random_uniform(4))
                
                let endPoint = CGPoint(x: 600, y: endY)
                let startPoint = CGPoint(x: startRange[ran], y: startY)
                
                print("fish")
                
                fish.layer.runAnimation(Animo.group(
                    Animo.wait(TimeInterval(ran)),
                    Animo.replayForever(
                        Animo.sequence(
                            Animo.move(from: startPoint, to: endPoint, duration: TimeInterval(time)),
                            timingMode: .linear,
                            options: Options(speed: 1, fillMode: Options.FillMode.both, removedOnCompletion: true)
                        )
                    )
                    ), completion: {
                        
                        
                })
                
                /*fish.layer.runAnimation(
                 
                 )*/
            }
            
            self.view.addSubview(self.tableView)
        }
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = Color.grey.lighten5
        self.tableView.backgroundColor = Color.clear
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CardCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = self.view.frame
        tableView.separatorStyle = .none
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return self.view.frame.height * 0.01
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
         return 500
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = Color.clear
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CardCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //cell.clipsToBounds = true
        let customCell = cell as! CardCell
        
        customCell.card.presenterView?.height = cell.height * 0.5
        customCell.layoutIfNeeded()
        print("cell height should be \(customCell.card.height)")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return self.view.height * 0.6
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
