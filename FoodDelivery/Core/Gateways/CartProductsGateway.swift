//
//  CartGateway.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/25/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartProductsObserver: class {
    func didAddToCart(product: Product, count: Int)
    func didRemoveFromCart(product: Product)
    func didChangeCartItemPcs(product: Product, count: Int)
}

protocol CartProductsGateway {
    func subscribe(_ observer: CartProductsObserver)
    func unsubscribe(_ observer: CartProductsObserver)
    func add(product: Product)
    func remove(product: Product)
    func changeCartItemPcs(product: Product, count: Int)
}

class CartProductsGatewayImplementation: CartProductsGateway {
    
    static let shared = CartProductsGatewayImplementation()

    var storage = CacheProductsCartImplementation()
    var observers = [CartProductsObserver]()
    
    private init() {
    }
    
    func subscribe(_ observer: CartProductsObserver) {
        print("\(observer) subscribed")
        observers.append(observer)
    }
    
    func unsubscribe(_ observer: CartProductsObserver) {
         print("\(observer) unsubscribed")
        if let index = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
        }
    }

    func add(product: Product) {
        observers.forEach {$0.didAddToCart(product: product, count: 1)}
        storage.add(product, count: 1)
    }
    
    func remove(product: Product) {
        
    }
    
    func changeCartItemPcs(product: Product, count: Int) {

    }
}
