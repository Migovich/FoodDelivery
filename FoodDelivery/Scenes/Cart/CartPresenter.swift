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
    func addToCartListener(products: [Product])
}

class CartPresenterImplementation: CartPresenter {
    
//    func add(product: Product) {
//        products.append(product)
//        //view.insertProductAtIndex(index: lastIndex)
//        for product in products {
//
//        }
//    }
    
    fileprivate weak var view: CartView?
    //fileprivate let cartProductsUseCaseDelegate: CartProductsUseCaseDelegate
    
    var products = [Product]()
    var storage = [Product: Int]()
    //добавить дикшинари
    //апдейтить каунт в дикшинари
    
    var numberOfRows: Int {
        return products.count
    }
    
    init(view: CartView) {
        self.view = view
       //self.cartProductsUseCaseDelegate = delegate
    }
    
    func viewDidLoad() {
        view?.displayScreenTitle(title: "Cart")
        view?.setupView()
        self.addToCartListener(products: products)
    }
    
    func configure(cell: CartCellView, for indexPath: IndexPath) {
        let product = products[indexPath.row]
        cell.display(imageURL: product.imageURL)
        cell.display(price: "\(product.price) грн")
        cell.display(title: product.title)
        cell.display(pcs: "1")
    }

    func addToCartListener(products: [Product]) {
        print(products)
        view?.refreshCartView()
    }
}

extension CartPresenterImplementation: CartProductsUseCaseDelegate {
    func add(product: Product, count: Int) {
        products.append(product)
        storage[product] = count + 1
    }
    
    func remove(product: Product, count: Int) {
        
    }
    
    func productsPcsChanged(product: Product, to: Int) {
        
    }
}
