//
//  RestaurantDetailsViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 15/07/2024.
//

import Foundation

@MainActor
final class RestaurantDetailsViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Properties
    var id: Int = 0
    
    private(set) var restaurant: RestaurantDetailInfo? = nil
    
    
    //MARK: - Public
    func set(id: Int) {
        self.id = id
    }
    
    func set(restaurant: RestaurantDetailInfo) {
        self.restaurant = restaurant
    }
    
    //MARK: - Overrides
    override func loading() async -> Bool {
        let result = await super.loading()
        
        let success = await self.restaurant()
        
        return result && success
    }
    
}

// MARK: - Requests
extension RestaurantDetailsViewModel {
    
    private func restaurant() async -> Bool {
        do {
            let response = try await self.api.fetchRestaurantDetails(for: id)
            self.set(restaurant: response)
            return true
        } catch {
            self.handle(error: error.localizedDescription, title: "Error while fetching restaurant")
            return false
        }
    }
}
