//
//  ViewController.swift
//  NotificationMiniProject
//
//  Created by Lambda-School-Loaner-11 on 8/16/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

let changeBackGroundNotification = Notification.Name(rawValue: "changeBackground")

class ViewController: UIViewController {
    
    @IBAction func postNotification(_ sender: Any) {
        
        NotificationCenter.default.post(name: changeBackGroundNotification, object: nil)
    }
}

