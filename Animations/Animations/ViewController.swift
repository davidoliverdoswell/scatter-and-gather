//
//  ViewController.swift
//  Animations
//
//  Created by Lambda-School-Loaner-11 on 8/29/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenSquare.backgroundColor = .green
        view.addSubview(greenSquare)
    }
    
    @IBAction func animate(_ sender: Any) {
        
        CATransaction.begin()
    
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = [UIColor.black.cgColor, UIColor.green.cgColor, UIColor.blue.cgColor, UIColor.red.cgColor]
        animation.duration = 2.0

        greenSquare.layer.add(animation, forKey: "backgroundColorAnimation")
        
        CATransaction.setCompletionBlock {
            self.greenSquare.backgroundColor = .red
            
            self.greenSquare.frame = CGRect(x: 150, y: 150, width: 100, height: 100)
        }
        CATransaction.commit()
        
    }
    
    let greenSquare = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))

}

