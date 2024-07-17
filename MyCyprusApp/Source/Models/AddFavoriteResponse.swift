//
//  AddFavoriteResponse.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 17/07/2024.
//

import Foundation

struct AddFavoriteResponse: Decodable {
    
    let id: Int
    let user: String
    let organization: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case user = "user"
        case organization = "organization"
    }
}
