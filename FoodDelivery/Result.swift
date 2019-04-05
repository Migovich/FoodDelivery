//
//  Result.swift
//  FoodDelivery
//
//  Created by Myhovych on 3/29/19.
//  Copyright © 2019 Artem Migovich. All rights reserved.
//

import Foundation

struct CoreError: Error {
    var localizedDescription: String {
        return message
    }
    
    var message = ""
}

// See https://github.com/antitypical/Result
enum Result<T> {
    case success(T)
    case failure(Error)
    
    public func dematerialize() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error
        }
    }
}
