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
    func didRemoveFromCart(product: Product, count: Int)
    func didChangeCartItemPcs(product: Product, count: Int)
}

protocol CartProductsGateway {
    func subscribe(_ observer: CartProductsObserver)
    func unsubscribe(_ observer: CartProductsObserver)
    func add(product: Product)
    func remove(product: Product)
    func changeCartItem(for changes: CartProductsChanges)
}

class CartProductsGatewayImplementation: CartProductsGateway {
    
    static let shared = CartProductsGatewayImplementation(storage: CacheProductsCartImplementation(), observers: [])

    var storage: CacheProductsCart?
    // Список обсерверов которые подписаны на нотификации
    private lazy var observers = [CartProductsObserver]()
    
    init(storage: CacheProductsCart, observers: [CartProductsObserver]) {
        self.storage = storage
        self.observers = observers
    }
    
    // MARK: - Observer
    
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

    // MARK: - Storage
    
    func add(product: Product) {
        observers.forEach {$0.didAddToCart(product: product, count: 1)}
        storage?.add(product, count: 1)
    }
    
    func remove(product: Product) {
        storage?.remove(product)
    }
    
    func changeCartItem(for changes: CartProductsChanges) {
        
    }
}
