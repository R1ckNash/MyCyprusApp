//
//  RestaurantDetailInfo.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

struct RestaurantDetailInfo: Decodable {
    
    let id: Int
    let name: String
    let photoUrls: [String]
    
    let detailedInfo: String
    let rate: Float?
    let averageCheck: [String]
    
    let isFavorite: Bool
    let distance: String?
    
    var formattedRate: String {
        String(format: "%.1f", rate ?? 0.0)
    }
    
    var formattedAverageCheck: String {
        String("€ 1000")
    }
    
    var formattedDistance: String {
        String("\(distance ?? "2 km")")
    }
    
    var formattedDetailedInfo: String {
        detailedInfo.isEmpty ? "Aster Bakery — это кафе-пекарня с открытой кухней, где посетители могут наблюдать за процессом приготовления хлеба и выпечки. Меню включает в себя разнообразные завтраки, такие как скрэмбл, вареные яйца и авокадо-тосты, а также основное меню с блюдами, такими как ризотто и капкейки." : detailedInfo
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case photoUrls = "photos"
        
        case detailedInfo = "detailedInfo"
        case rate = "rate"
        case averageCheck = "averageCheck"
        
        case isFavorite = "isFavorite"
        case distance = "distance"
    }
    
}

#if DEBUG
extension RestaurantDetailInfo {
    static let preview: RestaurantDetailInfo = .init(id: 1, name: "Ledrahan", photoUrls: [
        "https://api.mycyprus.app/media/organizations/1.JPG",
        "https://api.mycyprus.app/media/organizations/2.JPG",
        "https://api.mycyprus.app/media/organizations/3.JPG",
        "https://api.mycyprus.app/media/organizations/Ekran_Al%C4%B1nt%C4%B1s%C4%B1.JPG",
        "https://api.mycyprus.app/media/organizations/Ekran_Al%C4%B1nt%C4%B1s%C4%B11.JPG"
    ], detailedInfo: "Aster Bakery — это кафе-пекарня с открытой кухней, где посетители могут наблюдать за процессом приготовления хлеба и выпечки. Меню включает в себя разнообразные завтраки, такие как скрэмбл, вареные яйца и авокадо-тосты, а также основное меню с блюдами, такими как ризотто и капкейки.", rate: 4.5, averageCheck: [], isFavorite: false, distance: nil)
}
#endif
