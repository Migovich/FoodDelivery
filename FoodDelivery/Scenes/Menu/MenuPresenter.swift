//
//  MainPresenter.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol MenuView: class {
    func displayScreenTitle(title: String)
    func setupView()
    func refreshMenuView()
}

protocol ProductCellView {
    func display(imageURL: URL)
    func display(title: String)
    func display(subtitle: String)
    func display(price: String)
}

protocol CategoryCellView {
    func display(title: String)
    func setupView()
}

protocol MenuPresenter {
    var numberOfSections: Int { get }
    func isExpanded(for section: Int)
    func numberOfRowsInSection(section: Int) -> Int
    func viewDidLoad()
    func configure(cell: ProductCellView, for indexPath: IndexPath)
    func configure(header: CategoryHeaderFooterView, delegate: ExpandableHFVDelegate?, section: Int)
    func getProduct(section: Int, row: Int) -> Product
}

class MenuPresenterImplementation: MenuPresenter {

    fileprivate weak var view: MenuView?
    fileprivate let displayCategoriesUseCase: DisplayCategoriesUseCase
    
    var menuSections = [MenuSection]()
    var previousSection: Int!

    var numberOfSections: Int {
        return menuSections.count
    }
    
    func isExpanded(for section: Int) {
        menuSections[section].isExpanded = !menuSections[section].isExpanded
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard menuSections.indices.contains(section) else { return 0 }
        let sectionItem = menuSections[section]
        return sectionItem.isExpanded ? sectionItem.category.products.count : 0
    }
    
    init(view: MenuView, displayCategoriesUseCase: DisplayCategoriesUseCase) {
        self.view = view
        self.displayCategoriesUseCase = displayCategoriesUseCase
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Menu")
        view?.setupView()
            self.displayCategoriesUseCase.displayCategories { (result) in
                switch result {
                case let .success(categories):
                    self.handleMenuSectionsReceived(categories)
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }

    func configure(cell: ProductCellView, for indexPath: IndexPath) {
        let product = menuSections[indexPath.section].category.products[indexPath.row]
        cell.display(imageURL: product.imageURL!)
        cell.display(title: product.title)
        cell.display(subtitle: product.subtitle)
        cell.display(price: "\(product.price) грн")
    }

    func configure(header: CategoryHeaderFooterView, delegate: ExpandableHFVDelegate?, section: Int) {
        header.display(title: menuSections[section].category.title)
        header.configure(delegate: delegate)
    }
    
    func getProduct(section: Int, row: Int) -> Product {
        let product = menuSections[section].category.products[row]
        CartProductsGatewayImplementation.shared.add(product: product)
        return product
    }
    
    fileprivate func handleMenuSectionsReceived(_ categories: [Category]) {
        self.menuSections = categories.map { MenuSection(category: $0, isExpanded: false) }
        view?.refreshMenuView()
    }
}
