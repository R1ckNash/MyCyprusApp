//
//  RestaurantRequests.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation
import Alamofire

final class RestaurantRequests {
    
    func fetch() throws -> URLRequest {
        
        let url = URL(string: "https://api.mycyprus.app/api/" + RestaurantApiPath.restaurants.rawValue)!
        
        let headers: HTTPHeaders = [
            "Authorization": "Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQ1LCJleHAiOjE3MjEzNTMzNzJ9.jp1s88PCsQFFORZxTEcXBYX83dG2cGme_1Z2EFkmZ00",
        ]
        
        return try .init(url: url, method: .get, headers: headers)
    }
    
    func fetchDetails(for id: Int) throws -> URLRequest {
        
        let url = URL(string: "https://api.mycyprus.app/api/" + RestaurantApiPath.restaurantDetails.rawValue + String(id) + "/")!
        
        let headers: HTTPHeaders = [
            "Authorization": "Token eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQ1LCJleHAiOjE3MjEzNTMzNzJ9.jp1s88PCsQFFORZxTEcXBYX83dG2cGme_1Z2EFkmZ00",
        ]
        
        return try .init(url: url, method: .get, headers: headers)
    }
}
