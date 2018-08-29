//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Lambda-School-Loaner-11 on 8/29/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shouldScramble: Bool?
    
    let logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "LambdaLogo")
        return image
    }()
    
    let firstLetter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let secondLetter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let thirdLetter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let fourthLetter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let fifthLetter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let sixthLetter: UILabel = {
        let label = UILabel()
        return label
    }()
    
    @IBAction func toggle(_ sender: Any) {
    
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func setUpViews() {
        
        view.addSubview(logo)
        view.addSubview(firstLetter)
        view.addSubview(secondLetter)
        view.addSubview(thirdLetter)
        view.addSubview(fourthLetter)
        view.addSubview(fifthLetter)
        view.addSubview(sixthLetter)
        
        
        
    }
}

