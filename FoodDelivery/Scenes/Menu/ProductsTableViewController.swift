//
//  MainViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController, ProductsView, ExpandableHFVDelegate {
    
    var presenter: ProductsPresenter!
    var configurator = ProductsConfiguratorImplementation()
    
    var menuSections = [MenuSections(category: "🍔 Burger", products: ["BigMac", "Chizburger", "Gamburger", "Big Tasty", "Fishburger"], isExpanded: false),
                        MenuSections(category: "🍣 Sushi", products: ["Philadelfia", "Kalifornia", "Green dragon", "Unagi"], isExpanded: false),
                        MenuSections(category: "🥗 Salad", products: ["Cezar", "Greece"], isExpanded: false),
                        MenuSections(category: "🥤 Drinks", products: ["Coca-Cola", "Fanta", "Sprite"], isExpanded: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(productsTableViewController: self)
        presenter.viewDidLoad()
    }
    
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func setupView() {
        self.view.backgroundColor = UIColor.mainGreen()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ProductsTableViewCell.self)
        tableView.register(ProductsSectionHFV.self)
    }
    
    func toggleSection(header: ProductsSectionHFV, section: Int) {
        print("Section: ", section)
        menuSections[section].isExpanded = !menuSections[section].isExpanded
        tableView.beginUpdates()
        for i in 0..<menuSections[section].products.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(ProductsSectionHFV.self)
        headerView.customInit(title: menuSections[section].category, section: section, delegate: self)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (menuSections[indexPath.section].isExpanded) {
            return 40
        } else {
            return 0
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return menuSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard menuSections.indices.contains(section) else {
            return 0
        }
        return menuSections[section].products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard menuSections.indices.contains(indexPath.section) else {
            assertionFailure("Sections does not contain section at indexPath: \(indexPath)")
            return UITableViewCell()
        }
        let cell: ProductsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        guard menuSections[indexPath.section].products.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        let product = menuSections[indexPath.section].products[indexPath.row]
        cell.titleLabel.text = product
        return cell
    }
}
