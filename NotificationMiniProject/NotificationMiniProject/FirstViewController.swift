//
//  FirstViewController.swift
//  NotificationMiniProject
//
//  Created by Lambda-School-Loaner-11 on 8/16/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackground), name: changeBackGroundNotification, object: nil)

    }
    
    @objc func changeBackground() {
        view.backgroundColor = .blue
    }
}
