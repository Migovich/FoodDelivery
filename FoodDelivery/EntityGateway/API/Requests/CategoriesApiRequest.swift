//
//  CategoriesApiRequest.swift
//  FoodDelivery
//
//  Created by Myhovych on 4/22/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct CategoriesApiRequest: ApiRequest {
    var urlRequest: URLRequest {
        let url: URL! = URL(string: "http://localhost:3000/api/categories")
        var request = URLRequest(url: url)
        
        request.setValue("application/foodDelivery.categories-list+json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"
        
        return request
    }
}
