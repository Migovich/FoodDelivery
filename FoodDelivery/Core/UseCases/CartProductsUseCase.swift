//
//  CartProductsUseCase.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartProductsDelegate: class {
    func productsPcsChanged(product: Product, to: Int)
}

protocol CartProductsUseCase {
    func increaseProductPcs(product: Product, count: Int)
    func decreaseProductPcs(product: Product, count: Int)
    func displayCartProducts(products from: CacheProductsCart)
}

class CartProductsUseCaseImplementation: CartProductsUseCase {
    
    var delegate: CartProductsDelegate?
    
    func increaseProductPcs(product: Product, count: Int) {
        let count = count + 1
        delegate?.productsPcsChanged(product: product, to: count)
    }
    
    func decreaseProductPcs(product: Product, count: Int) {
        let count = count - 1
        delegate?.productsPcsChanged(product: product, to: count)
    }
    
    func displayCartProducts(products from: CacheProductsCart) {
        
    }
}
