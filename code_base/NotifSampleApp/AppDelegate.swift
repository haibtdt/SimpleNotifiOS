//
//  AppDelegate.swift
//  NotifSampleApp
//
//  Created by SB 8 on 9/7/15.
//  Copyright (c) 2015 vn.haibui. All rights reserved.
//

import UIKit
import SimpleNotifiOS

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    let notifManager = SNNotificationManager()

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        notifManager.remoteNotificationArrivalHandler = { userInfo in
            
            let alert = UIAlertView(title: "Remote content", message: userInfo.description, delegate: nil, cancelButtonTitle: "OK")
            alert.show()

        }
        notifManager.application(application, didFinishLaunchingWithOptions: launchOptions)
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

    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        
        notifManager.application(application, didRegisterUserNotificationSettings: notificationSettings)
        
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        notifManager.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
        
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
        
        notifManager.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
        
        
    }
    
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        notifManager.application(application, didReceiveRemoteNotification: userInfo)        
        
    }
    



}

