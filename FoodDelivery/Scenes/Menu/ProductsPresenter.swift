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
}

protocol ProductCellView {
    func display(title: String)
}

protocol ProductsPresenter {
    var numberOfProducts: Int { get }
    var numberOfSections: Int { get }
    func viewDidLoad()
    func configure(cell: ProductCellView, forRow row: Int)
}

class ProductsPresenterImplementation: ProductsPresenter {
    fileprivate weak var view: ProductsView?
    
    var numberOfSections: Int {
        return 0
    }
    
    var numberOfProducts: Int {
        return 0
    }
    
    init(view: ProductsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Menu")
    }
    
    func configure(cell: ProductCellView, forRow row: Int) {
        cell.display(title: "")
    }
}
