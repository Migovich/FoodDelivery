//
//  ApiCategoriesGatewayImplementation.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/2/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

protocol ApiCategoriesGateway: CategoriesGateway {
    
}

class ApiCategoriesGatewayImplementation: ApiCategoriesGateway {
    
    let apiClient: ApiClient
    let decoder = JSONDecoder()
    
    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    // MARK: - ApiCategoriesGateway
    func fetchCategories(completionHandler: @escaping (_ result: Result<[ApiCategory]>) -> Void) {
        DispatchQueue.main.async {
            let categoriesApiRequest = CategoriesApiRequest()
            self.apiClient.execute(request: categoriesApiRequest) { result in
                switch result {
                    case let .success(response):
                        do {
                            let responseCategories = try self.decoder.decode(ApiCategoryResponse.self, from: response.data!)
                            let apiCategories = responseCategories.categories
                            completionHandler(.success(apiCategories))
                        } catch {
                            completionHandler(.failure(error))
                        }
                    case .failure(let error):
                        completionHandler(.failure(error))
                }
            }
        }
    }
}
