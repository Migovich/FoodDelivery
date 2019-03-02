//
//  CartConfigurator.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartConfigurator {
    func configure(cartViewController: CartViewController)
}

class CartConfiguratorImplementation: CartConfigurator {
    
    func configure(cartViewController: CartViewController) {
        
        let presenter = CartPresenterImplementation(view: cartViewController)
        
        cartViewController.presenter = presenter
    }
}
