//
//  MainViewController.swift
//  FoodDelivery
//
//  Created by Myhovych on 2/21/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import UIKit

enum CategorySections: String, CaseIterable {
    case burger
    case sushi
    case salad
    case drink
}

class ProductsTableViewController: UITableViewController, ProductsView {

    var presenter: ProductsPresenter!
    var configurator = ProductsConfiguratorImplementation()
    
    var products = [CategorySections.burger.rawValue: ["BigMac", "Chizburger", "Gamburger", "Big Tasty", "Fishburger"],
                    CategorySections.sushi.rawValue: ["Philadelfia", "Kalifornia", "Green dragon", "Unagi"],
                    CategorySections.salad.rawValue: ["Cezar", "Greece"],
                    CategorySections.drink.rawValue: ["Coca-Cola", "Fanta", "Sprite"]]
    let sectionImage = #imageLiteral(resourceName: "right-arrow")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.mainGreen()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configurator.configure(productsTableViewController: self)
        presenter.viewDidLoad()
        
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.productId)
    }
    
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
    
    // MARK: - UITableViewDataSource
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

        let image = UIImageView (image: sectionImage)
        image.frame = CGRect(x: 380, y: 5, width: 24, height: 24)
        view.addSubview(image)
        
        let label = UILabel()
        label.text = CategorySections.allCases[section].rawValue.capitalized
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.frame = CGRect(x: 5, y: 0, width: 100, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return CategorySections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = CategorySections.allCases[section].rawValue
        guard let values = products[key] else { return 0 }
        return values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.productId, for: indexPath) as! ProductsTableViewCell
        let key = CategorySections.allCases[indexPath.section].rawValue
        let values = products[key]?[indexPath.row]
        cell.titleLabel.text = values
        //presenter.configure(cell: cell, forRow: indexPath.row)
        return cell
    }
}
