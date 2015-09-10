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

    @IBOutlet weak var tfDeviceToken: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func registerRemoteNotification(sender: AnyObject) {
        
        if let notifManager = (UIApplication.sharedApplication().delegate as? AppDelegate)?.notifManager {
            
            notifManager.registerAPNS({ (deviceToken, error) -> Void in
                
                self.tfDeviceToken.text = deviceToken?.description
                
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

