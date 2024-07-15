//
//  Api.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation
import Alamofire

final class Api {
    
    // MARK: Singletone
    static let shared: Api = .init()
    
    // MARK: Properties
    private let requests: ApiRequests
    
    // MARK: Life cycle
    init() {
        self.requests = .init()
    }
    
    // MARK: Base
    func send<T: Decodable>(request: URLRequest) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(request)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let result):
                        continuation.resume(returning: result)
                    case .failure(let error):
                        continuation.resume(throwing: error)
                    }
                }
        }
    }
    
    
    // MARK: - Restaurants
    func fetchRestaurants() async throws -> BaseResponse<Restaurant> {
        let request = try self.requests.restaurants.fetch()

        return try await self.send(request: request)
    }
    
    func fetchRestaurantDetails(for id: Int) async throws -> RestaurantDetailInfo {
        let request = try self.requests.restaurants.fetchDetails(for: id)

        return try await self.send(request: request)
    }
       
}
