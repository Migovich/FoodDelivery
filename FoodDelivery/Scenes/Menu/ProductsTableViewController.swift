//
//  MainViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ProductsTableViewController: UITableViewController, ProductsView, ExpandableHFVDelegate {

    // MARK: - Properties
    var presenter: ProductsPresenter!
    var configurator = ProductsConfiguratorImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(productsTableViewController: self)
        presenter.viewDidLoad()
    }

    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func setupView() {
        self.view.backgroundColor = R.color.mainGreen()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ProductsTableViewCell.self)
        tableView.register(CategoryHeaderFooterView.self)
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(CategoryHeaderFooterView.self)
        presenter.configure(header: headerView, delegate: self, section: section)
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? CategoryHeaderFooterView {
            headerView.setupView()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }

    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ProductsTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, for: indexPath)
        return cell
    }

    func toggleSection(header: CategoryHeaderFooterView) {
        guard let section = tableView.sectionIndexForHeaderView(header) else { return }
        presenter.isExpanded(for: section)
        tableView.beginUpdates()
        tableView.reloadSections(.init(integer: section), with: .automatic)
        tableView.endUpdates()
    }
    
    func refreshMenuView() {
        tableView.reloadData()
    }
}
