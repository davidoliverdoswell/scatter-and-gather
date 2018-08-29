//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Lambda-School-Loaner-11 on 8/29/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble = Bool()
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LambdaLogo")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let firstLetter: UILabel = {
        let label = UILabel()
        label.text = "L"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.tag = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondLetter: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.tag = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thirdLetter: UILabel = {
        let label = UILabel()
        label.text = "M"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.tag = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fourthLetter: UILabel = {
        let label = UILabel()
        label.text = "B"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.tag = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let fifthLetter: UILabel = {
        let label = UILabel()
        label.text = "D"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.tag = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sixthLetter: UILabel = {
        let label = UILabel()
        label.text = "A"
        label.font = UIFont.boldSystemFont(ofSize: 80)
        label.tag = 6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @IBAction func toggle(_ sender: Any) {
        CATransaction.begin()
        
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = [UIColor.red.cgColor, UIColor.purple.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
        animation.duration = 2.0
        
        logo.layer.add(animation, forKey: "backgroundColorAnimation")
        
        CATransaction.setCompletionBlock {
            self.firstLetter.transform = CGAffineTransform(rotationAngle: 30.0)
            self.secondLetter.transform = CGAffineTransform(rotationAngle: -30.0)
            self.thirdLetter.transform = CGAffineTransform(rotationAngle: 20.0)
            self.fourthLetter.transform = CGAffineTransform(rotationAngle: -10.0)
            self.fifthLetter.transform = CGAffineTransform(rotationAngle: 80.0)
            self.sixthLetter.transform = CGAffineTransform(rotationAngle: -50.0)
            
        }
        
        CATransaction.commit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
       
    }
    
    func setUpViews() {
        
        view.addSubview(logo)
        
        view.addSubview(firstLetter)
        view.addSubview(secondLetter)
        view.addSubview(thirdLetter)
        view.addSubview(fourthLetter)
        view.addSubview(fifthLetter)
        view.addSubview(sixthLetter)
        
        // logo
        
        let centerX = NSLayoutConstraint(item: logo, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0)
        
        let centerY = NSLayoutConstraint(item: logo, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        let width = NSLayoutConstraint(item: logo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 400)
        
        let height = NSLayoutConstraint(item: logo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200)
        
        NSLayoutConstraint.activate([width, height, centerY, centerX])
        
        // first
        
        let leftCenterX = NSLayoutConstraint(item: firstLetter, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 30)
        
        let firstCenterY = NSLayoutConstraint(item: firstLetter, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1.0, constant: 30)
        
        let firstWidth = NSLayoutConstraint(item: firstLetter, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        let firstHeight = NSLayoutConstraint(item: firstLetter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        NSLayoutConstraint.activate([leftCenterX, firstCenterY, firstWidth, firstHeight])
        
        // second
        
        let secondCenterX = NSLayoutConstraint(item: secondLetter, attribute: .centerX, relatedBy: .equal, toItem: firstLetter, attribute: .centerX, multiplier: 1.0, constant: 40)
        
        let secondCenterY = NSLayoutConstraint(item: secondLetter, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1.0, constant: 30)
        
        let secondWidth = NSLayoutConstraint(item: secondLetter, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        let secondHeight = NSLayoutConstraint(item: secondLetter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        NSLayoutConstraint.activate([secondCenterX, secondCenterY, secondWidth, secondHeight])
        
        // third
        
        let thirdCenterX = NSLayoutConstraint(item: thirdLetter, attribute: .centerX, relatedBy: .equal, toItem: secondLetter, attribute: .centerX, multiplier: 1.0, constant: 50)
        
        let thirdCenterY = NSLayoutConstraint(item: thirdLetter, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1.0, constant: 30)
        
        let thirdWidth = NSLayoutConstraint(item: thirdLetter, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        let thirdHeight = NSLayoutConstraint(item: thirdLetter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        NSLayoutConstraint.activate([thirdCenterX, thirdCenterY, thirdWidth, thirdHeight])
        
        // fourth
        
        let fourthCenterX = NSLayoutConstraint(item: fourthLetter, attribute: .centerX, relatedBy: .equal, toItem: thirdLetter, attribute: .centerX, multiplier: 1.0, constant: 65)
        
        let fourthCenterY = NSLayoutConstraint(item: fourthLetter, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1.0, constant: 30)
        
        let fourthWidth = NSLayoutConstraint(item: fourthLetter, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        let fourthHeight = NSLayoutConstraint(item: fourthLetter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        NSLayoutConstraint.activate([fourthCenterX, fourthCenterY, fourthWidth, fourthHeight])
        
        // fifth
        
        let fifthCenterX = NSLayoutConstraint(item: fifthLetter, attribute: .centerX, relatedBy: .equal, toItem: fourthLetter, attribute: .centerX, multiplier: 1.0, constant: 50)
        
        let fifthCenterY = NSLayoutConstraint(item: fifthLetter, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1.0, constant: 30)
        
        let fifthWidth = NSLayoutConstraint(item: fifthLetter, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        let fifthHeight = NSLayoutConstraint(item: fifthLetter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        NSLayoutConstraint.activate([fifthCenterX, fifthCenterY, fifthWidth, fifthHeight])
        
        // sixth
        
        let sixthCenterX = NSLayoutConstraint(item: sixthLetter, attribute: .centerX, relatedBy: .equal, toItem: fifthLetter, attribute: .centerX, multiplier: 1.0, constant: 50)
        
        let sixthCenterY = NSLayoutConstraint(item: sixthLetter, attribute: .bottom, relatedBy: .equal, toItem: logo, attribute: .top, multiplier: 1.0, constant: 30)
        
        let sixthWidth = NSLayoutConstraint(item: sixthLetter, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        let sixthHeight = NSLayoutConstraint(item: sixthLetter, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100)
        
        NSLayoutConstraint.activate([sixthCenterX, sixthCenterY, sixthWidth, sixthHeight])
    }
}

