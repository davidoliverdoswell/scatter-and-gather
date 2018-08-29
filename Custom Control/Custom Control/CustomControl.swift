//
//  CustomControl.swift
//  Custom Control
//
//  Created by Lambda-School-Loaner-11 on 8/28/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    let value: Int = 1
    
    // Constants
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    let labelOne = UILabel()
    let labelTwo = UILabel()
    let labelThree = UILabel()
    let labelFour = UILabel()
    let labelFive = UILabel()

    var labels: [UILabel] = []
    
    func setUp() {
        
        backgroundColor = .white
        
        labelOne.tag = 1
        labelOne.frame = CGRect(x: componentDimension + 8.0, y: 0, width: componentDimension, height: componentDimension)
        labelOne.font = UIFont.boldSystemFont(ofSize: 32.0)
        labelOne.text = "✩"
        labelOne.textAlignment = .center
        labelOne.textColor = componentInactiveColor
   
        labelTwo.tag = 2
        labelTwo.frame = CGRect(x: componentDimension * 2 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        labelTwo.font = UIFont.boldSystemFont(ofSize: 32.0)
        labelTwo.text = "✩"
        labelTwo.textAlignment = .center
        labelTwo.textColor = componentInactiveColor
        
        labelThree.tag = 3
        labelThree.frame = CGRect(x: componentDimension * 3 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        labelThree.font = UIFont.boldSystemFont(ofSize: 32.0)
        labelThree.text = "✩"
        labelThree.textAlignment = .center
        labelThree.textColor = componentInactiveColor
        
        labelFour.tag = 4
        labelFour.frame = CGRect(x: componentDimension * 4 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        labelFour.font = UIFont.boldSystemFont(ofSize: 32.0)
        labelFour.text = "✩"
        labelFour.textAlignment = .center
        labelFour.textColor = componentInactiveColor
        
        labelFive.tag = 5
        labelFive.frame = CGRect(x: componentDimension * 5 + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
        labelFive.font = UIFont.boldSystemFont(ofSize: 32.0)
        labelFive.text = "✩"
        labelFive.textAlignment = .center
        labelFive.textColor = componentInactiveColor
        
        addSubview(labelOne)
        addSubview(labelTwo)
        addSubview(labelThree)
        addSubview(labelFour)
        addSubview(labelFive)
    }
    
    func updateValue(at touch: UITouch) {
        
        for label in labels {
            touch.location(in: self)
            if label.tag == 1 {
                labelOne.backgroundColor = componentActiveColor
                sendActions(for: .valueChanged)
            }
        }
       
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

        updateValue(at: touch)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDown, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }

        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
}
