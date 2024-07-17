//
//  RestaurantRequests.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation
import Alamofire

final class RestaurantRequests {
    
    let headers: HTTPHeaders = [
        "Authorization": "Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQ1LCJleHAiOjE3MjEzNTMzNzJ9.jp1s88PCsQFFORZxTEcXBYX83dG2cGme_1Z2EFkmZ00",
    ]
    
    func fetch() throws -> URLRequest {
        let url = URL(string: RestaurantApiPath.restaurants.path)!
        return try .init(url: url, method: .get, headers: headers)
    }
    
    func fetchDetails(for id: Int) throws -> URLRequest {
        let url = URL(string: RestaurantApiPath.restaurantDetails(id: id).path)!
        return try .init(url: url, method: .get, headers: headers)
    }
    
    func addToFavorites(for id: Int) throws -> URLRequest {
        let url = URL(string: RestaurantApiPath.addRestaurantToFavorites(id: id).path)!
        return try .init(url: url, method: .post, headers: headers)
    }
    
    func removeFromFavorites(for id: Int) throws -> URLRequest {
        let url = URL(string: RestaurantApiPath.removeRestaurantFromFavorites(id: id).path)!
        return try .init(url: url, method: .delete, headers: headers)
    }
}
