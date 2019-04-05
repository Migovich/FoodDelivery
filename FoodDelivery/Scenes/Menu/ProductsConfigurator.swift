//
//  MainConfigurator.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol ProductsConfigurator {
    func configure(productsTableViewController: ProductsTableViewController)
}

class ProductsConfiguratorImplementation: ProductsConfigurator {
    
    func configure(productsTableViewController: ProductsTableViewController) {
        
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default, completionHandlerQueue: OperationQueue.main)
        
        let apiCategoriesGateway = ApiCategoriesGatewayImplementation(apiClient: apiClient)
        
        let displayCategoriesUseCase = DisplayCategoriesUseCaseImplementation(categoriesGateway: apiCategoriesGateway)
        
        let presenter = ProductsPresenterImplementation(view: productsTableViewController, displayCategoriesUseCase: displayCategoriesUseCase)
        
        productsTableViewController.presenter = presenter
    }
}
