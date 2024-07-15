//
//  Restaurant.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

struct Restaurant: Decodable, Hashable {
    
    let id: Int
    let name: String
    let photoUrl: String
    
    let rate: Float?
    let averageCheck: [Int]
    let cuisines: [String]
    
    let isFavorite: Bool
    let distance: String?
    
    var formattedRate: String {
        String(format: "%.1f", rate ?? 0.0)
    }
    
    var formattedAverageCheck: String {
        String("€ 1000")
    }
    
    var formattedCuisines: String {
        cuisines.joined(separator: ", ")
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        
        case photoUrl = "photo"
        case rate = "rate"
        case averageCheck = "averageCheck"
        
        case cuisines = "cuisines"
        case isFavorite = "isFavorite"
        
        case distance = "distance"
    }
}

#if DEBUG
extension Restaurant {
    static let preview: Restaurant = .init(id: 1, name: "Ledrahan", photoUrl: "https://api.mycyprus.app/media/organizations/1_BV88ANE.JPG", rate: 4.5, averageCheck: [], cuisines: ["Mediterranean", "Grill", "Fast Food", "Steakhouse", "Diner"], isFavorite: false, distance: nil)
}
#endif
