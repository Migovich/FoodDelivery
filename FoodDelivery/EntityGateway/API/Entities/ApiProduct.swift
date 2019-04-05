//
//  ApiProduct.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/22/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct ApiProduct: Codable {
    let title: String
    let description: String
    let price: Int
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case price
        case imageURL = "image_url"
    }
}

extension ApiProduct {
    var product: Product {
        return Product(title: title,
                       subtitle: description,
                       price: Double(price),
                       imageURL: URL(string: imageURL))
    }
}
