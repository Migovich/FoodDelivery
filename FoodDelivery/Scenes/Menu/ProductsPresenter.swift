//
//  MainPresenter.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol ProductsView: class {
    func displayScreenTitle(title: String)
    //func displayMenuSectionsRetrievalError(title: String, message: String)
    func refreshMenuView()
    func setupView()
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

protocol ProductsPresenter {
    var numberOfSections: Int { get }
    func isExpanded(for section: Int)
    func numberOfRowsInSection(section: Int) -> Int
    func viewDidLoad()
    func configure(cell: ProductCellView, for indexPath: IndexPath)
    func configure(header: CategoryHeaderFooterView, delegate: ExpandableHFVDelegate?, section: Int)
    func addButtonPressed()
}

class ProductsPresenterImplementation: ProductsPresenter {

    fileprivate weak var view: ProductsView?
    fileprivate let displayCategoriesUseCase: DisplayCategoriesUseCase
    
    var menuSections = [MenuSection]()
    
    var numberOfSections: Int {
        return menuSections.count
    }
    
    func isExpanded(for section: Int) {
        menuSections[section].isExpanded = !menuSections[section].isExpanded
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        guard menuSections.indices.contains(section) else {
            return 0
        }
        let sectionItem = menuSections[section]
        return sectionItem.isExpanded ? sectionItem.category.products.count : 0
    }
    
    init(view: ProductsView,
         displayCategoriesUseCase: DisplayCategoriesUseCase) {
        self.view = view
        self.displayCategoriesUseCase = displayCategoriesUseCase
    }
    
    func viewDidLoad() {
        //TODO: transfer view setup to configure func
        view?.displayScreenTitle(title: "Menu")
        view?.setupView()
            self.displayCategoriesUseCase.displayCategories { (result) in
                switch result {
                case let .success(menuSections):
                    self.handleMenuSectionsReceived(menuSections)
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
    
    fileprivate func handleMenuSectionsReceived(_ menuSections: [MenuSection]) {
        self.menuSections = menuSections
        view?.refreshMenuView()
    }
    
    func addButtonPressed() {
    }
    
}
