//
//  RestaurantApiPath.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

enum RestaurantApiPath {
    
    /// GET: /Restaurants
    case restaurants
    
    /// GET: /Restaurant details
    case restaurantDetails(id: Int)
    
    /// POST: /Add restaurant to favorites
    case addRestaurantToFavorites(id: Int)
    
    /// DELETE: /Remove restaurant to favorites
    case removeRestaurantFromFavorites(id: Int)
    
    var path: String {
        switch self {
        case .restaurants:
            return "https://api.mycyprus.app/api/internship/organizations/category/1/organizations/"
        case .restaurantDetails(let id):
            return "https://api.mycyprus.app/api/internship/organization/\(id)/"
        case .addRestaurantToFavorites(let id):
            return "https://api.mycyprus.app/api/internship/organization/\(id)/favorite/"
        case .removeRestaurantFromFavorites(let id):
            return "https://api.mycyprus.app/api/internship/organization/\(id)/favorite/"
        }
    }
}
