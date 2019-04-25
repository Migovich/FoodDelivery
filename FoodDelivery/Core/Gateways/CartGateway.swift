//
//  CartGateway.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/25/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

class CartGateway {
    
    var product: Product = {
        return Product(title: "Burger", subtitle: "Tasty", price: 50, imageURL: nil)
    }()
    
    private lazy var observers = [MenuObserver]()
    
    func subscribe(_ observer: MenuObserver) {
        print(#function)
        observers.append(observer)
    }
    
    func unsubscribe(_ observer: MenuObserver) {
        print(#function)
        if let index = observers.firstIndex(where: {$0 === observer}) {
            observers.remove(at: index)
            print(#function)
        }
    }
    
    func notify() {
        print(#function)
        observers.forEach({$0.addToCart(subject: self)})
    }
    
    func addCartListner() {
        print(#function)
        notify()
    }
}
