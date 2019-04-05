//
//  DisplayMenu.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/29/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

typealias  DisplayCategoriesUseCaseCompletionHandler = (_ menuCategories: Result<[MenuSection]>) -> Void

protocol DisplayCategoriesUseCase {
    func displayCategories(completionHandler: @escaping DisplayCategoriesUseCaseCompletionHandler)
}

class DisplayCategoriesUseCaseImplementation: DisplayCategoriesUseCase {
    let categoriesGateway: CategoriesGateway
    
    init(categoriesGateway: CategoriesGateway) {
        self.categoriesGateway = categoriesGateway
    }
    
    // MARK: - DisplayMenuCategoriesUseCase
    func displayCategories(completionHandler: @escaping (Result<[MenuSection]>) -> Void) {
        self.categoriesGateway.fetchCategories { (result) in
            // Do any additional processing & after that call the completion handler
            completionHandler(result)
        }
    }
}
