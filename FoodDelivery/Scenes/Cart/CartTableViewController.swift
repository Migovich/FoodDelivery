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

    // MARK: - CellTableView
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CartTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, for: indexPath)
        return cell
    }
    
    // MARK: - FooterView
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let confirmButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("CONFIRM ORDER", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.setTitleColor(R.color.gray(), for: .normal)
            button.backgroundColor = R.color.darkWhite()
            button.addTarget(self, action: #selector(confirmOrder), for: .touchUpInside)
            button.layer.cornerRadius = 15
            return button
        }()
        footerView.addSubview(confirmButton)
        confirmButton.anchor(top: footerView.topAnchor, left: footerView.leftAnchor,
                          bottom: nil, right: footerView.rightAnchor,
                          paddingTop: 24, paddingLeft: 64,
                          paddingBottom: 0, paddingRight: 64,
                          width: 0, height: 40)
        footerView.backgroundColor = R.color.mainGreen()
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }
    
    // MARK: - Selectors
    
    @objc func confirmOrder() {
        
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
