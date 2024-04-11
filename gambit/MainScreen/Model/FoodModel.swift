//
//  FoodModel.swift
//  gambit
//
//  Created by samil on 08.12.2023.
//

import Foundation

struct FoodModel: Codable {
    let id: Int
    let name: String
    let image: String
    let price: Int
    let description: String
}
