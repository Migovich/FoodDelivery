//
//  Products.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/6/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct MenuProduct {
    let title: String
    let subtitile: String
    let price: Price
    let category: MenuCategory
    let image: Image?
}

extension MenuProduct {
    static var fixture: MenuProduct {
        let randomIndex = Int.random(in: 0..<10)
        return MenuProduct(title: "Title_\(randomIndex)",
            subtitile: "Subtitle_\(randomIndex)",
            price: .init(value: 10.0, currency: "UAH"),
            category: .fixture, image: nil)
    }
}

struct Image {
    let imageUrl: URL
    let thumbnailUrl: URL
    let ratio: Double
}

struct Price {
    let value: Decimal
    let currency: String
}

struct MenuCategory {
    enum CategoryType: String, CaseIterable {
        case unknown
        case burger
        case sushi
        case salad
        case drink
    }
    
    let type: CategoryType
    let name: String
    let identifier: Int
}

extension MenuCategory {
    static var fixture: MenuCategory {
        let categories = CategoryType.allCases
        let categoryIndex = Int.random(in: 0..<categories.count)
        return MenuCategory(type: categories[categoryIndex],
                            name: "Category_\(categoryIndex)",
            identifier: categoryIndex)
    }
}

struct MenuSection {
    let category: MenuCategory
    let products: [MenuProduct]
    var isExpanded: Bool
}

extension MenuSection {
    static var fixture: MenuSection {
        return MenuSection(category: .fixture,
                           products: [
                            .fixture, .fixture, .fixture, .fixture, .fixture
            ],
                           isExpanded: false)
    }
}
