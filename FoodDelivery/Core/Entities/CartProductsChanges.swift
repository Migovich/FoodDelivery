//
//  CartProductsChanges.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/13/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct CartProductsChanges {
    enum Changes {
        case increase
        case decrease
    }
    
    let product: Product
    let count: Int
    let changes: Changes
}
