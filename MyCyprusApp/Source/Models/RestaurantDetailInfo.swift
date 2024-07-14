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


//{
//    "id": 2367,
//    "name": "Big Chefs",
//    "email": null,
//    "categoryName": "Restaurants",
//    "detailedInfo": "",
//    "photos": [
//        "https://api.mycyprus.app/media/organizations/1.JPG",
//        "https://api.mycyprus.app/media/organizations/2.JPG",
//        "https://api.mycyprus.app/media/organizations/3.JPG",
//        "https://api.mycyprus.app/media/organizations/Ekran_Al%C4%B1nt%C4%B1s%C4%B1.JPG",
//        "https://api.mycyprus.app/media/organizations/Ekran_Al%C4%B1nt%C4%B1s%C4%B11.JPG"
//    ],
//    "phones": [
//        "+905338482100"
//    ],
//    "urls": [
//        "https://www.bigchefs.com.tr/tr-tr/bigchefs-cyprus"
//    ],
//    "socials": [
//        {
//            "id": 184,
//            "type": 1,
//            "name": "Instagram",
//            "url": "https://www.instagram.com/bigchefscyprus/",
//            "organization": 2367
//        }
//    ],
//    "location": {
//        "id": 2363,
//        "latitude": 35.1995194,
//        "longitude": 33.3531943,
//        "city": "Lefkoşa",
//        "address": "59X3+R74, Şht. Erol İsmail Sk, Lefkoşa 99010",
//        "organization": 2367,
//        "district": 4
//    },
//    "schedule": [
//        {
//            "day": 1,
//            "start": 32400,
//            "end": 79200
//        },
//        {
//            "day": 2,
//            "start": 32400,
//            "end": 79200
//        },
//        {
//            "day": 3,
//            "start": 32400,
//            "end": 79200
//        },
//        {
//            "day": 4,
//            "start": 32400,
//            "end": 79200
//        },
//        {
//            "day": 5,
//            "start": 32400,
//            "end": 79200
//        },
//        {
//            "day": 6,
//            "start": 32400,
//            "end": 79200
//        }
//    ],
//    "rateCount": 1,
//    "rate": 5.0,
//    "averageCheck": [],
//    "services": [],
//    "serviceLanguages": [
//        "EN",
//        "TR"
//    ],
//    "cuisines": [],
//    "reviewCount": 1,
//    "review": null,
//    "distance": null,
//    "discount": 15,
//    "isFavorite": false
//}
