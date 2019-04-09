//
//  AddToCart.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/10/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

typealias AddToCartUseCaseCompletionHandler = (_ products: Result<Product>) -> Void

protocol AddToCartUseCase {
    func add(parameters: AddToCartParameters, completionHandler: @escaping AddToCartUseCaseCompletionHandler)
}

struct AddToCartParameters {
    var title: String
    var imageURL: String
    var price: Int
    var pcs: Int
}
