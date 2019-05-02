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
    func addToCartListener(products: [Product:Int])
}

class CartPresenterImplementation: CartPresenter {
    
    fileprivate weak var view: CartView?
    
    var products = [Product]()
    
    var numberOfRows: Int {
        return products.count
    }
    
    init(view: CartView) {
        self.view = view
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Cart")
        view?.setupView()
        //self.addToCartListener()
    }
    
    func configure(cell: CartCellView, for indexPath: IndexPath) {
        let product = products[indexPath.row]
        cell.display(imageURL: product.imageURL)
        cell.display(price: "\(product.price) грн")
        cell.display(title: product.title)
        cell.display(pcs: "1")
    }
    
    func addToCartListener(products: [Product:Int]) {
        print(products)
        view?.refreshCartView()
    }
}
