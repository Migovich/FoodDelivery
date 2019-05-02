//
//  MemoryCartStorage.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/1/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CacheProductsCartProtocol: class {
    func add(_ product: Product, count: Int)
    func remove(_ product: Product)
}

class CacheProductsCart: CacheProductsCartProtocol {
    
    var products = [Product: Int]()
    
    func add(_ product: Product, count: Int) {
        products.updateValue(count, forKey: product)
    }
    
    func remove(_ product: Product) {
        products.removeValue(forKey: product)
    }
}
