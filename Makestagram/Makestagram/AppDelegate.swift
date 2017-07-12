//
//  AppDelegate.swift
//  Makestagram
//
//  Created by Matthew on 7/10/17.
//  Copyright © 2017 Matthew Harrilal. All rights reserved.
//

import UIKit
import Firebase
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? // why is this optional initially ?
    
    
   
    
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        let storyboard = UIStoryboard(name:"Login", bundle: .main)
        if let initialViewController = storyboard.instantiateInitialViewController(){
            window?.rootViewController = initialViewController
            window?.makeKeyAndVisible() // all the code before this line makes the login storyboard the initial view controller the initial controller in the log in storyboard though but this window?.makeKeyandVisible() declares it the first view controller out of the whole app and through that all of the storyboards you may have THIS LINE BAISCALLY SETS IT NOT TO BE CONFUSED WITH SETTER
            // Another way of referring to the whole app is bundle 
        }
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

