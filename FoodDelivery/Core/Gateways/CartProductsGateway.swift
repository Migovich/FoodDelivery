//
//  CartGateway.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/25/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartProductsObserver: class {
    func didAddToCart(product: Product)
}

protocol CartProductsGateway {
    func subscribe(_ observer: CartProductsObserver)
    func unsubscribe(_ observer: CartProductsObserver)
    func add(product: Product)
}

class CartProductsGatewayImplementation: CartProductsGateway {
    
    var storage = CacheProductsCart()
    private lazy var observers = [CartProductsObserver]()
    
    init(storage: CacheProductsCart, observers: [CartProductsObserver]) {
        self.storage = storage
        self.observers = observers
    }
    
    func subscribe(_ observer: CartProductsObserver) {
        print("\(observer) subscribed")
        observers.append(observer)
    }
    
    func unsubscribe(_ observer: CartProductsObserver) {
        print(#function)
        if let index = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
            print(#function)
        }
    }

    func add(product: Product) {
        print(#function)
        observers.forEach {$0.didAddToCart(product: product)}
        storage.add(product, count: 1)
    }
}
