//
//  MemoryCartStorage.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/1/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

class CacheProductsCart {
    
    var products = [Product: Int]()
    
    func add(_ product: Product, count: Int) {
        products.updateValue(count, forKey: product)
    }
    
    func remove(_ product: Product) {
        
    }
}
