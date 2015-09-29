//
//  SNNotificationManager.swift
//  SimpleNotifiOS
//
//  Created by SB 8 on 9/7/15.
//  Copyright (c) 2015 vn.haibui. All rights reserved.
//

import Foundation


public class SNNotificationManager : NSObject {
    
    public var notificationTypes = UIUserNotificationType(rawValue: UIUserNotificationType.Alert.rawValue | UIUserNotificationType.Sound.rawValue | UIUserNotificationType.Badge.rawValue)
    var permissionsAvailableHandler : ((notificationSettings : UIUserNotificationSettings) -> Void)? = nil
    var apnsRegistrationResultAvailableHandler : ((deviceToken : NSData?, error : NSError?) -> Void)? = nil
    public var remoteNotificationArrivalHandler : ((userInfo: [NSObject : AnyObject]) -> Void)? = nil
    
    public func askForUserPermissions (permissionsAvailableHandler : ((notificationSettings : UIUserNotificationSettings) -> Void)?) -> Void {
        
        self.permissionsAvailableHandler = permissionsAvailableHandler
        let settings = UIUserNotificationSettings(forTypes: notificationTypes, categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)

        
    }
    
    public func registerAPNS (apnsRegistrationResultAvailableHandler : ((deviceToken : NSData?, error : NSError?) -> Void)) -> Void {

        self.apnsRegistrationResultAvailableHandler = apnsRegistrationResultAvailableHandler
        UIApplication.sharedApplication().registerForRemoteNotifications()
        
        
    }
    
    public func askThenRegisterAPNS (apnsRegistrationResultAvailableHandler : ((deviceToken : NSData?, error : NSError?) -> Void)) -> Void {
        
        askForUserPermissions({ (notificationSettings : UIUserNotificationSettings) -> Void in
            
            if notificationSettings.types != .None {
                
                
                self.registerAPNS(apnsRegistrationResultAvailableHandler)
                
                
            } else {
                
                let err = NSError(domain: "APNS", code: 0, userInfo: [NSLocalizedDescriptionKey:"NOT_PERMITTED"])
                apnsRegistrationResultAvailableHandler(deviceToken: nil, error: err)
                
            }
            
        })

        
    }
    

    public func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        
        permissionsAvailableHandler?(notificationSettings: notificationSettings)
        
    }
    
    
    public func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        apnsRegistrationResultAvailableHandler?(deviceToken: deviceToken, error: nil)
        
    }
    
    
    public func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
        
        apnsRegistrationResultAvailableHandler?(deviceToken: nil, error: error)
        
    }

    
    public func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        
        remoteNotificationArrivalHandler?(userInfo: userInfo)
        
    }
    
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        //extract remote
        if let remoteNotificationPayload = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] as? [String : AnyObject] {
            
            remoteNotificationArrivalHandler?(userInfo: remoteNotificationPayload)
            
            
            
        }

        //extract local
        if let _ = launchOptions?[UIApplicationLaunchOptionsRemoteNotificationKey] as? UILocalNotification {
            
            
            
            
            
        }
        
        
        
        
        
        return true
    }

    
}