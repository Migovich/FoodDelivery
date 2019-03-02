//
//  OrderViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, CartView {
    
    var presenter: CartPresenter!
    var configurator: CartConfigurator!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationItem.title = "Cart"
        self.view.backgroundColor = UIColor.mainGreen()
        self.configurator.configure(cartViewController: self)
        self.presenter.viewDidLoad()
    }
    
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
}
