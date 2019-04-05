//
//  ApiCategoryResponse.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/26/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct ApiCategoryResponse: Codable {
    let categories: [ApiCategory]
    
    enum CodingKeys: String, CodingKey {
        case categories
    }
}
