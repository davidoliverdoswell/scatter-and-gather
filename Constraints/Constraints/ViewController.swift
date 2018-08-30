//
//  ViewController.swift
//  Constraints
//
//  Created by Lambda-School-Loaner-11 on 8/29/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func animate(_ sender: Any) {
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5) {
            self.greenWidthConstraint.constant = 300
            self.greenCenterYConstraint.constant = -200
            self.view.layoutIfNeeded()
        }
    }
    
    var greenWidthConstraint: NSLayoutConstraint!
    var greenCenterYConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greenSquare = UIView()
        greenSquare.translatesAutoresizingMaskIntoConstraints = false
        greenSquare.backgroundColor = .green
        view.addSubview(greenSquare)
        
        let widthConstraint = NSLayoutConstraint(item: greenSquare, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        
        greenWidthConstraint = widthConstraint
        
        let heightConstraint = NSLayoutConstraint(item: greenSquare, attribute: .height, relatedBy: .equal, toItem: greenSquare, attribute: .width, multiplier: 1.0, constant: 0)
        
        let centerY = NSLayoutConstraint(item: greenSquare, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        greenCenterYConstraint = centerY
        
        let centerX = NSLayoutConstraint(item: greenSquare, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        
        NSLayoutConstraint.activate([heightConstraint, widthConstraint, centerX, centerY])
    }

}

