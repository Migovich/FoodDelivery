//
//  MainViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    // MARK: - Properties
    var presenter: MenuPresenter!
    var configurator = MenuConfiguratorImplementation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(productsTableViewController: self)
        presenter.viewDidLoad()
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
        let cell: ProductTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        presenter.configure(cell: cell, for: indexPath)
        cell.delegate = self
        return cell
    }
}

extension MenuTableViewController: ProductTableViewCellDelegate {
    func addToCartButtonTapped(_ sender: ProductTableViewCell) {
        guard let tappedIndexPath = tableView.indexPath(for: sender) else { return }
        print(tappedIndexPath)
    }
}

extension MenuTableViewController: ExpandableHFVDelegate {
    func toggleSection(_ sender: CategoryHeaderFooterView) {
        guard let section = tableView.sectionIndexForHeaderView(for: sender) else { return }
        presenter.isExpanded(for: section)
        tableView.beginUpdates()
        tableView.reloadSections(.init(integer: section), with: .automatic)
        tableView.endUpdates()
    }
}

extension MenuTableViewController: MenuView {
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
    
    func setupView() {
        self.view.backgroundColor = R.color.mainGreen()
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ProductTableViewCell.self)
        tableView.register(CategoryHeaderFooterView.self)
    }
    
    func refreshMenuView() {
        tableView.reloadData()
    }
}
