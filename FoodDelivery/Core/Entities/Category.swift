//
//  MenuCategoty.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/20/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct Category {
    let identifier: Int
    let title: String
    var imageURL: URL?
    let products: [Product]
}
