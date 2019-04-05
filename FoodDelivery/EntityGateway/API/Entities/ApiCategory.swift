//
//  ApiCategory.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/26/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct ApiCategory: Codable {
    
    let identifier: Int
    let title: String
    let products: [ApiProduct]
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title
        case products
        case imageURL = "image_url"
    }
}

extension ApiCategory {
    var category: Category {
        return Category(identifier: identifier,
                        title: title,
                        imageURL: URL(string: imageURL ?? ""),
                        products: products.map { $0.product })
    }
}
