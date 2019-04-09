//
//  CartPresenter.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartView: class {
    func displayScreenTitle(title: String)
    func setupView()
}

protocol CartPresenter {
    func viewDidLoad()
}

class CartPresenterImplementation: CartPresenter {
    fileprivate weak var view: CartView?
    
    init(view: CartView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Cart")
        view?.setupView()
    }
}
