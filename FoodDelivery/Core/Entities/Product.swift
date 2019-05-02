//
//  MenuProduct.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/20/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct Product: Hashable {
    let title: String
    let subtitle: String
    let price: Double
    let imageURL: URL?
}
