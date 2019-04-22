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
    func fetchCategories(completionHandler: @escaping (_ result: Result<[ApiCategory]>) -> Void) {
        DispatchQueue.main.async {
            let categoriesApiRequest = CategoriesApiRequest()
            self.apiClient.execute(request: categoriesApiRequest) { result in
                switch result {
                    case let .success(response):
                        let decoder = JSONDecoder()
                        do {
                            let responseCategories = try decoder.decode(ApiCategoryResponse.self, from: response.data!)
                            let apiCategories = responseCategories.categories
                            completionHandler(Result.success(apiCategories))
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}
