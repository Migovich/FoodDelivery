//
//  CartPresenter.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol CartView: class {
    func displayScreenTitle(title: String)
    func setupView()
    func refreshCartView()
}

protocol CartCellView {
    func display(imageURL: URL?)
    func display(title: String)
    func display(price: String)
    func display(pcs: String)
}

protocol CartPresenter {
    var numberOfRows: Int { get }
    func viewDidLoad()
    func configure(cell: CartCellView, for indexPath: IndexPath)
}

class CartPresenterImplementation: CartPresenter {

    fileprivate weak var view: CartView?

    var products = [Product]()
    var storage = [Product: Int]()

    var numberOfRows: Int {
        return storage.count
    }
    
    init(view: CartView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Кошик")
        view?.setupView()
    }
    
    func configure(cell: CartCellView, for indexPath: IndexPath) {
        let product = Array(storage)[indexPath.row].key
        let count = storage[product]
        
        cell.display(imageURL: product.imageURL)
        cell.display(price: "\(product.price) грн")
        cell.display(title: product.title)
        cell.display(pcs: "\(count!)")
    }
}

extension CartPresenterImplementation: CartProductsUseCaseDelegate {
    func add(product: Product, count: Int) {
        storage[product] = count
        view?.refreshCartView()
    }
    
    func remove(product: Product, count: Int) {
        
    }
    
    func productsPcsChanged(product: Product, to: Int) {
        
    }
}
