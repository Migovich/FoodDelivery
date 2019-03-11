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
    var configurator = CartConfiguratorImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.mainGreen()
        configurator.configure(cartViewController: self)
        presenter.viewDidLoad()
    }
    
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
}
