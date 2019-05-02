//
//  CartConfigurator.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartConfigurator {
    func configure(cartTableViewController: CartTableViewController)
}

class CartConfiguratorImplementation: CartConfigurator {
    
    func configure(cartTableViewController: CartTableViewController) {
        
        let presenter = CartPresenterImplementation(view: cartTableViewController)
        
        cartTableViewController.presenter = presenter
    }
}
