//
//  AppDelegate.swift
//  Squad
//
//  Created by Michael Vieth on 12/3/15.
//  Copyright © 2015 Michael Vieth. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Bolts
import SAHistoryNavigationViewController


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // [Optional] Power your app with Local Datastore. For more info, go to
        // https://parse.com/docs/ios_guide#localdatastore/iOS
        Parse.enableLocalDatastore()
        
        // Initialize Parse.
        Parse.setApplicationId("Ano3eYmw8ImVbYnRymX0EXBURo3RkfWO411BkLLw",
            clientKey: "cUnW5zIt92woeU2vsoxVoC8TwTFyDv9eFlf3TqoK")
        
        // [Optional] Track statistics around application opens.
        PFAnalytics.trackAppOpenedWithLaunchOptions(launchOptions)
        
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.0, green: 0.549, blue: 0.89, alpha: 1.0)
        UINavigationBar.appearance().tintColor = .whiteColor()
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: false)
        
        (window?.rootViewController as? UINavigationController)?.historyDelegate = self
        
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: SAHistoryNavigationViewControllerDelegate {
    func historyControllerDidShowHistory(controller: SAHistoryNavigationViewController, viewController: UIViewController) {
        print("did show history")
    }
}