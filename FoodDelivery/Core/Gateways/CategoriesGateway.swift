//
//  MenuSectionsGateway.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/29/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

typealias FetchCategoriesEntityGatewayCompletionHandler = (_ menuSection: Result<[MenuSection]>) -> Void

protocol CategoriesGateway {
    func fetchCategories(completionHandler: @escaping FetchCategoriesEntityGatewayCompletionHandler)
}
