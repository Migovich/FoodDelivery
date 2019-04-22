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
    // выкинуть alamofire и использовать urlsession
    func fetchCategories(completionHandler: @escaping (_ result: Result<[ApiCategory]>) -> Void) {
        DispatchQueue.main.async {
            // TODO: Read about .validate
            
            //api client.execute
            Alamofire.request("http://localhost:3000/api/categories")
                .responseData(completionHandler: { response in
                    switch response.result {
                    case .success(let data):
                        let decoder = JSONDecoder()
                        do {
                            let responseCategories = try decoder.decode(ApiCategoryResponse.self, from: data)
                            let apiCategories = responseCategories.categories
                            completionHandler(Result.success(apiCategories))
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
