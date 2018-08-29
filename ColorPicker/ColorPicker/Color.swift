//
//  Color.swift
//  ColorPicker
//
//  Created by Lambda-School-Loaner-11 on 8/28/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

// A utility Color type

struct Color {
    
    // Use the offset angle to determine a selected hue and saturation
    static func getHueSaturation(at offset: CGSize) -> (hue: CGFloat, saturation: CGFloat) {
        let saturation = sqrt(offset.width * offset.width + offset.height * offset.height)
        var hue = acos(offset.width / saturation) / (2.0 * CGFloat.pi)
        if offset.height < 0 { hue = 1.0 - hue }
        return (hue: hue, saturation: saturation)
    }
}
