//
//  CartTableViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/9/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    var presenter: CartPresenter!
    var configurator = CartConfiguratorImplementation()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(cartTableViewController: self)
        presenter.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, for: indexPath)
        return cell
    }
}

extension CartTableViewController: CartView {
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func setupView() {
        self.view.backgroundColor = R.color.mainGreen()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(CartTableViewCell.self)
    }
    
    func refreshCartView() {
        tableView.reloadData()
    }
}
