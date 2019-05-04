//
//  CartProductsUseCase.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartProductsDelegate: class {
    func add(product: Product)
    func remove(product: Product)
    func productsPcsChanged(product: Product, to: Int)
}

protocol CartProductsUseCase {
    func increaseProductPcs(product: Product, count: Int)
    func decreaseProductPcs(product: Product, count: Int)
    func display(cart products: CacheProductsCart)
}

class CartProductsUseCaseImplementation: CartProductsUseCase, CartProductsObserver {
    
    var gateway = CartProductsGatewayImplementation.shared
    var delegate: CartProductsDelegate?
    
    // MARK: - Use case
    
    func increaseProductPcs(product: Product, count: Int) {
        
    }
    
    func decreaseProductPcs(product: Product, count: Int) {
        
    }
    
    func display(cart products: CacheProductsCart) {

    }
    
    // MARK: - Observer
    
    func didAddToCart(product: Product, count: Int) {
        delegate?.add(product: product)
    }
    
    func didRemoveFromCart(product: Product) {
        delegate?.remove(product: product)
    }
    
    func didChangeCartItemPcs(product: Product, count: Int) {
        delegate?.productsPcsChanged(product: product, to: count)
    }
}
