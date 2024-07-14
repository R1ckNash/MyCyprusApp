//
//  Restaurant.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

struct Restaurant: Decodable {
    
    let id: Int
    let name: String
    let photoUrl: String
    
    let rate: Double?
    let averageCheck: [Int]
    let cuisines: [String]
    
    let isFavorite: Bool
    let distance: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        
        case photoUrl = "photo"
        case rate = "middleName"
        case averageCheck = "averageCheck"
        
        case cuisines = "cuisines"
        case isFavorite = "isFavorite"
        
        case distance = "distance"
    }
}

