//
//  MainConfigurator.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol MenuConfigurator {
    func configure(productsTableViewController: MenuTableViewController)
}

class MenuConfiguratorImplementation: MenuConfigurator {
    
    func configure(productsTableViewController: MenuTableViewController) {
        
        let apiClient = ApiClientImplementation(urlSessionConfiguration: URLSessionConfiguration.default, completionHandlerQueue: OperationQueue.main)
        
        let apiCategoriesGateway = ApiCategoriesGatewayImplementation(apiClient: apiClient)
        
        let displayCategoriesUseCase = DisplayCategoriesUseCaseImplementation(categoriesGateway: apiCategoriesGateway)
        
        let presenter = MenuPresenterImplementation(view: productsTableViewController, displayCategoriesUseCase: displayCategoriesUseCase)
        
        productsTableViewController.presenter = presenter
    }
}
