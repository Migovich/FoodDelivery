//
//  CounterButton.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/13/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

@IBDesignable
class CounterButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 12
    }
}
