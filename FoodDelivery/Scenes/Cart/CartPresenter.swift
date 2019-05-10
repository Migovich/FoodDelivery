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
   // func insertRowAtIndex //будет рендерить
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
        return products.count
    }
    
    init(view: CartView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Cart")
        view?.setupView()
    }
    
    func configure(cell: CartCellView, for indexPath: IndexPath) {
        let product = products[indexPath.row]
        cell.display(imageURL: product.imageURL)
        cell.display(price: "\(product.price) грн")
        cell.display(title: product.title)
        cell.display(pcs: "1")
    }
}

extension CartPresenterImplementation: CartProductsUseCaseDelegate {
    func add(product: Product, count: Int) {
        products.append(product)
        storage[product] = count + 1
        view?.refreshCartView()
    }
    
    func remove(product: Product, count: Int) {
        
    }
    
    func productsPcsChanged(product: Product, to: Int) {
        
    }
}
