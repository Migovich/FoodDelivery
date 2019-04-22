//
//  DisplayMenu.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/29/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

typealias  DisplayCategoriesUseCaseCompletionHandler = (_ categories: Result<[Category]>) -> Void

protocol DisplayCategoriesUseCase {
    func displayCategories(completionHandler: @escaping DisplayCategoriesUseCaseCompletionHandler)
}

class DisplayCategoriesUseCaseImplementation: DisplayCategoriesUseCase {
    let categoriesGateway: CategoriesGateway
    
    init(categoriesGateway: CategoriesGateway) {
        self.categoriesGateway = categoriesGateway
    }
    
    // MARK: - DisplayMenuCategoriesUseCase
    func displayCategories(completionHandler: @escaping (Result<[Category]>) -> Void) {
        self.categoriesGateway.fetchCategories { (result) in
            switch result {
            case let .success(menuSections):
                let categories = menuSections.map { $0.category }
                completionHandler(Result.success(categories))
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
