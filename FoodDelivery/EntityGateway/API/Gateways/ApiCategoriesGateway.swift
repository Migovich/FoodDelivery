//
//  ApiCategoriesGatewayImplementation.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiCategoriesGateway: CategoriesGateway {
    
}

class ApiCategoriesGatewayImplementation: ApiCategoriesGateway {
    
    let apiClient: ApiClient
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - ApiCategoriesGateway
    
    func fetchCategories(completionHandler: @escaping (_ result: Result<[MenuSection]>) -> Void) {
        DispatchQueue.main.async {
            // TODO: Read about .validate
            Alamofire.request("http://localhost:3000/api/categories")
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let decoder = JSONDecoder()
                        do {
                            let responseCategories = try decoder.decode(ApiCategoryResponse.self, from: data)
                            let apiCategories = responseCategories.categories
                            let categories = apiCategories.map { $0.category }
                            let menuSections = categories.map { MenuSection(category: $0, isExpanded: false) }
                            completionHandler(Result.success(menuSections))
                            //self?.menuSections = menuSections
                            //self?.tableView.reloadData()
                            print(menuSections)
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                })
        }
    }
}
