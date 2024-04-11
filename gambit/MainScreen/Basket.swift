//
//  Basket.swift
//  gambit
//
//  Created by samil on 25.12.2023.
//

import Foundation


struct BasketModel: Codable {
    var food: FoodModel
    var countInCart: Int
}


class Basket {
    
    static var shared = Basket()
    
    private var menu : [BasketModel] = []
    private var menuForFavorites: [FoodModel] = []
    
    private init () {
        guard let data = UserDefaults.standard.data(forKey: "basket"),
              let menuFromBasket = try? JSONDecoder().decode([BasketModel].self, from: data),
              let favData = UserDefaults.standard.data(forKey: "fav"),
              let favFromUserDefaults = try? JSONDecoder().decode([FoodModel].self, from: favData) else { return }
        
                
                menu.append(contentsOf: menuFromBasket)
                menuForFavorites.append(contentsOf: favFromUserDefaults)
    }
    
    
    func isAddedToCart(item: FoodModel?) -> Bool {
        if let _ = menu.firstIndex(where: { $0.food.id == item?.id }) {
            return true
        } else {
            return false
        }
    }
    
    func addToCart(item: FoodModel) -> Int {
        if let index = menu.firstIndex(where: { $0.food.id == item.id }) {
            menu[index].countInCart += 1
            synchronize()
            return menu[index].countInCart
        } else {
            let newItem = BasketModel(food: item, countInCart: 1)
            menu.append(newItem)
            synchronize()
            return 1
        }
    }
    
    func removeFromCart(item: FoodModel) -> Int {
        if let index = menu.firstIndex(where:  { $0.food.id ==  item.id }) {
            if menu[index].countInCart > 1 {
                menu[index].countInCart  -= 1
                synchronize()
                return menu[index].countInCart
            } else {
                menu.remove(at: index)
                synchronize()
                return 0
            }
        } else {
            return 0
        }
    }
    
    func checkCount(item: FoodModel) -> Int {
        if let index = menu.firstIndex(where: { $0.food.id == item.id }) {
            let countInCart = menu[index].countInCart
            return countInCart
        } else {
            return 0
        }
    }
    
    private func synchronize() {
        guard let menu = try? JSONEncoder().encode(menu),
              let favItems = try? JSONEncoder().encode(menuForFavorites) else { return }
        
        UserDefaults.standard.set(menu, forKey: "basket")
        UserDefaults.standard.set(favItems, forKey: "fav")
    }
    
    func isFavorite(item: FoodModel) -> Bool {
        if let _ = menuForFavorites.first(where: { $0.id == item.id }) {
            return true
        } else {
             return false
        }
    }
    
    func addOrRemoveFavorite(item: FoodModel) -> Bool {
        if let index = menuForFavorites.firstIndex(where: { $0.id == item.id }) {
            
            menuForFavorites.remove(at: index)
            synchronize()
            return false
        } else {
            menuForFavorites.append(item)
            synchronize()
            return true
        }
    }
}
