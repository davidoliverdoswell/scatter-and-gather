//
//  ViewController.swift
//  ColorPicker
//
//  Created by Lambda-School-Loaner-11 on 8/28/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeColor(_ sender: ColorWheel) {
        
        view.backgroundColor = sender.color
        
    }
}

