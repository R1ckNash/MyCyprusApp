//
//  BaseResponse.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

struct BaseResponse<Body: Decodable>: Decodable {
    
    var data: [Body]?
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
