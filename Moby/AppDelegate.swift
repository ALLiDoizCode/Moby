//
//  AppDelegate.swift
//  Moby
//
//  Created by Jonathan on 10/26/16.
//  Copyright © 2016 Jonathan. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import GoogleMaps
import Parse
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let Map_Key = "AIzaSyBaLOj0HCkZ1fleUs-1ej-gtsZM97Mivmg"
    
    let APP_ID = "mlhn1mCdj1aJvr32aTsHNwiJ2NqM0Nmoyp7AZlMz"
    let Client_KEY = "3POz5oRMO9VOPVa5eHiudtWscK7YOrQmhMnKyVHQ"
    let SERVER = "https://parseapi.back4app.com/"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        
        IQKeyboardManager.sharedManager().enable = true
        
        GMSServices.provideAPIKey(Map_Key)
        
        Parse.enableLocalDatastore()
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = self.APP_ID
            $0.clientKey = self.Client_KEY
            $0.server = self.SERVER
        }
        Parse.initialize(with: configuration)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

