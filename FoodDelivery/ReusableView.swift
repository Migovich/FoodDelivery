//
//  ReusableView.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/14/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}
