//
//  UIColorExtension.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/16/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainGreen() -> UIColor {
        return UIColor.rgb(red: 55, green: 175, blue: 50)
    }
    
    static func googleRed() -> UIColor {
        return UIColor.rgb(red: 220, green: 78, blue: 65)
    }
}
