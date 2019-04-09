//
//  AddToCartPresenter.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/10/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol AddProductView: class {
    func updateAddButtonState(isEnabled enabled: Bool)
}

protocol AddProductPresenter {
    func addButtonPressed(parameters: AddToCartParameters)
}

protocol AddProductPresenterDelegate: class {
    func addProductPresenter(_ presenter: AddProductPresenter, didAdd product: Product)
}

class AddProductPresenterImplementation: AddProductPresenter {
    fileprivate weak var view: AddProductView?
    fileprivate var addProductUseCase: AddToCartUseCase
    fileprivate weak var delegate: AddProductPresenterDelegate?
    
    init(view: AddProductView,
         addProductUseCase: AddToCartUseCase,
         delegate: AddProductPresenterDelegate?) {
        self.view = view
        self.addProductUseCase = addProductUseCase
        self.delegate = delegate
    }
    
    func addButtonPressed(parameters: AddToCartParameters) {
        //updateNavigationItemsState(isEnabled: false)
        addProductUseCase.add(parameters: parameters) { (result) in
            //self.updateNavigationItemsState(isEnabled: true)
            switch result {
            case let .success(product):
                self.handleProductAdded(product)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Private
    fileprivate func handleProductAdded(_ product: Product) {
        delegate?.addProductPresenter(self, didAdd: product)
    }
}
