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

struct MenuProduct {
    let title: String
    let subtitile: String
    let price: Price
    let category: MenuCategory
    let image: Image?
}

extension MenuProduct {
    static var fixture: MenuProduct {
        let randomIndex = Int.random(in: 0..<10)
        return MenuProduct(title: "Title_\(randomIndex)",
            subtitile: "Subtitle_\(randomIndex)",
            price: .init(value: 10.0, currency: "UAH"),
            category: .fixture, image: nil)
    }
}

struct Image {
    let imageUrl: URL
    let thumbnailUrl: URL
    let ratio: Double
}

struct Price {
    let value: Decimal
    let currency: String
}

struct MenuCategory {
    enum CategoryType: String, CaseIterable {
        case unknown
        case burger
        case sushi
        case salad
        case drink
    }
    
    let type: CategoryType
    let name: String
    let identifier: Int
}

extension MenuCategory {
    static var fixture: MenuCategory {
        let categories = CategoryType.allCases
        let categoryIndex = Int.random(in: 0..<categories.count)
        return MenuCategory(type: categories[categoryIndex],
                            name: "Category_\(categoryIndex)",
            identifier: categoryIndex)
    }
}

struct MenuSection {
    let category: MenuCategory
    let products: [MenuProduct]
}

extension MenuSection {
    static var fixture: MenuSection {
        return MenuSection(category: .fixture,
                           products: [
                            .fixture, .fixture, .fixture, .fixture, .fixture
            ])
    }
}

class ProductsTableViewController: UITableViewController, ProductsView {

    var presenter: ProductsPresenter!
    var configurator = ProductsConfiguratorImplementation()
    
    /*
    var products = [CategorySections.burger.rawValue: ["BigMac", "Chizburger", "Gamburger", "Big Tasty", "Fishburger"],
                    CategorySections.sushi.rawValue: ["Philadelfia", "Kalifornia", "Green dragon", "Unagi"],
                    CategorySections.salad.rawValue: ["Cezar", "Greece"],
                    CategorySections.drink.rawValue: ["Coca-Cola", "Fanta", "Sprite"]]
    */
    
    // TODO: replace image with image from assets
    let sectionImage = #imageLiteral(resourceName: "right-arrow")
    
    let sections: [MenuSection] = [.fixture, .fixture, .fixture, .fixture]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Setup it from presenter
        self.view.backgroundColor = UIColor.mainGreen()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configurator.configure(productsTableViewController: self)
        presenter.viewDidLoad()
        
        // TODO: Do we really need to setup it in this place? Mayby using presenter?
        // Need to chekc example in github clean arch repo
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: ProductsTableViewCell.productId)
    }
    
    func displayScreenTitle(title: String) {
        self.navigationItem.title = title
    }
    
    // MARK: - UITableViewDataSource
    // TODO: Find solution, not create view every time (cache or reuse it)
    // https://developer.apple.com/documentation/uikit/uitableviewheaderfooterview
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //TODO: Create custom view with setting up constraints or frame earlier
        // Sample: ProductsSectionHeaderFooterView or ProductsSectionHFV
        //https://developer.apple.com/documentation/uikit/uitableviewheaderfooterview
        
        let view = UIView()
        // TODO: Do not use litterals for colors, use assets or color from rgb \ hex
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        let image = UIImageView (image: sectionImage)
        image.frame = CGRect(x: 380, y: 5, width: 24, height: 24)
        view.addSubview(image)
        
        let label = UILabel()
        //label.text = CategorySections.allCases[section].rawValue.capitalized
        label.text = sections[section].category.name
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.frame = CGRect(x: 5, y: 0, width: 200, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        //return CategorySections.allCases.count
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: Check, why do we need to add this guard
        guard sections.indices.contains(section) else {
            return 0
        }
        return sections[section].products.count
        /*
        return sections[section]
        let key = CategorySections.allCases[section].rawValue
        guard let values = products[key] else { return 0 }
        return values.count
        */
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: Why do we need to use this guard?
        guard sections.indices.contains(indexPath.section) else {
            assertionFailure("Sections does not contain section at indexPath: \(indexPath)")
            return UITableViewCell()
        }
        
        // TODO: Find solution to not use force unwrap
        // TODO: Find solution to use dequeue as generic
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsTableViewCell.productId, for: indexPath) as! ProductsTableViewCell
        
        /*
        let key = CategorySections.allCases[indexPath.section].rawValue
        let values = products[key]?[indexPath.row]
        cell.titleLabel.text = values
        //presenter.configure(cell: cell, forRow: indexPath.row)
        */
        // TODO: Why do we need to use this guard?
        guard sections[indexPath.section].products.indices.contains(indexPath.row) else {
            return UITableViewCell()
        }
        
        let product = sections[indexPath.section].products[indexPath.row]
        cell.titleLabel.text = product.title
        return cell
    }
}
