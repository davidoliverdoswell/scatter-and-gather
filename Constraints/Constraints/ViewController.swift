//
//  ViewController.swift
//  Constraints
//
//  Created by Lambda-School-Loaner-11 on 8/29/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greenSquare = UIView()
        greenSquare.translatesAutoresizingMaskIntoConstraints = false
        greenSquare.backgroundColor = .green
        view.addSubview(greenSquare)
        
        let purpleSquare = UIView()
        purpleSquare.translatesAutoresizingMaskIntoConstraints = false
        purpleSquare.backgroundColor = .purple
        view.addSubview(purpleSquare)
        
        let widthConstraint = NSLayoutConstraint(item: greenSquare, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        
        let heightConstraint = NSLayoutConstraint(item: greenSquare, attribute: .height, relatedBy: .equal, toItem: greenSquare, attribute: .width, multiplier: 1.0, constant: 0)
        
        let centerY = NSLayoutConstraint(item: greenSquare, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let centerX = NSLayoutConstraint(item: greenSquare, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        //
        
        let pWidthConstraint = NSLayoutConstraint(item: purpleSquare, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        
        let pHeightConstraint = NSLayoutConstraint(item: purpleSquare, attribute: .height, relatedBy: .equal, toItem: greenSquare, attribute: .width, multiplier: 1.0, constant: 0)
        
        let pBottom = NSLayoutConstraint(item: purpleSquare, attribute: .bottom, relatedBy: .equal, toItem: greenSquare, attribute: .bottom, multiplier: 1.0, constant: 210)
        
        let pCenterX = NSLayoutConstraint(item: purpleSquare, attribute: .centerX, relatedBy: .equal, toItem: greenSquare, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        
        NSLayoutConstraint.activate([heightConstraint, widthConstraint, centerX, centerY])
        
        NSLayoutConstraint.activate([pHeightConstraint, pWidthConstraint, pCenterX, pBottom])
        
        
    }

}

