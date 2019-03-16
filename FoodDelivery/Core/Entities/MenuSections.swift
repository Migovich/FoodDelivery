//
//  Products.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/6/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct MenuSections {
    var category: String!
    var products: [String]!
    var isExpanded: Bool!
    
    init(category: String, products: [String], isExpanded: Bool) {
        self.category = category
        self.products = products
        self.isExpanded = isExpanded
    }
}
