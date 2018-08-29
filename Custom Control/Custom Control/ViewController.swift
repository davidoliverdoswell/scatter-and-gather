//
//  ViewController.swift
//  Custom Control
//
//  Created by Lambda-School-Loaner-11 on 8/28/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {

        let customControl = CustomControl()

        switch customControl {
        case customControl.labelOne:
            self.title = "User rating: \(String(describing: customControl.value)) star"
        case customControl.labelTwo:
            self.title = "User rating: \(String(describing: customControl.value)) stars"
        case customControl.labelThree:
            self.title = "User rating: \(String(describing: customControl.value)) stars"
        case customControl.labelFour:
            self.title = "User rating: \(String(describing: customControl.value)) stars"
        case customControl.labelFive:
            self.title = "User rating: \(String(describing: customControl.value)) stars"
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
    }
}

