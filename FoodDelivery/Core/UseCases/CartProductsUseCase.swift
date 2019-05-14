//
//  CartProductsUseCase.swift
//  FoodDelivery
//
//  Created by Myhovych on 5/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartProductsUseCaseDelegate: class {
    func add(product: Product, count: Int)
    func remove(product: Product, count: Int)
    func productsPcsChanged(product: Product, to: Int)
}

protocol CartProductsUseCase {
    func increaseProductPcs(product: Product, count: Int)
    func decreaseProductPcs(product: Product, count: Int)
}

class CartProductsUseCaseImplementation: CartProductsUseCase, CartProductsObserver {
    
    var gateway: CartProductsGateway!
    private weak var delegate: CartProductsUseCaseDelegate?
    
    init(gateway: CartProductsGateway, delegate: CartProductsUseCaseDelegate) {
        self.gateway = gateway
        self.delegate = delegate
        self.gateway?.subscribe(self)
    }
    
    // MARK: - Use case for presenter
    
    func increaseProductPcs(product: Product, count: Int) {
         
    }
  
    func decreaseProductPcs(product: Product, count: Int) {
        
    }
    
    // MARK: - Observer
    
    func didAddToCart(product: Product, count: Int) {
        delegate?.add(product: product, count: count)
    }
    
    func didRemoveFromCart(product: Product, count: Int) {
        delegate?.remove(product: product, count: count)
    }
    
    func didChangeCartItemPcs(product: Product, count: Int) {
        delegate?.productsPcsChanged(product: product, to: count)
    }
}
