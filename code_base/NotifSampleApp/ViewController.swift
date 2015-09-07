//
//  ViewController.swift
//  NotifSampleApp
//
//  Created by SB 8 on 9/7/15.
//  Copyright (c) 2015 vn.haibui. All rights reserved.
//

import UIKit
import SimpleNotifiOS

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func registerRemoteNotification(sender: AnyObject) {
        
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            
            let notifManager = appDelegate.notifManager
            notifManager.registerAPNS({ (deviceToken, error) -> Void in
                
                
                
            })
            
            
        }

        
    }

    @IBAction func askForPermission(sender: AnyObject) {
        
        if let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate {
            
            let notifManager = appDelegate.notifManager
            notifManager.askForUserPermissions { (notificationSettings) -> Void in
                
                
                
            }
            
            
        }
        
    }

}

