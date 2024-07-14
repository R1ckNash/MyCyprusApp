//
//  RestaurantDetailInfo.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

struct RestaurantDetailInfo {
    
    let id: Int
    let name: String
    let photoUrls: [String]
    
    let rate: Double?
    let averageCheck: [String]
    
    let isFavorite: Bool
    let distance: String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        
        case photoUrls = "photos"
        case rate = "middleName"
        case averageCheck = "averageCheck"
        
        case cuisines = "cuisines"
        case isFavorite = "isFavorite"
        
        case distance = "distance"
    }
    
}

