//
//  RestaurantsViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

final class RestaurantsViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Publishers
    @Published var restaurants: [Restaurant] = []
    
    //MARK: - Overrides
    override func loading() async -> Bool {
        let result = await super.loading()
        
        let success = await self.restaurants()
        
        return result && success
    }
}

// MARK: - Requests
extension RestaurantsViewModel {
    
    private func restaurants() async -> Bool {
        do {
            let response = try await self.api.fetchRestaurants()
            self.restaurants = .init(response.data ?? [])
            
            return true
        } catch {
            self.handle(error: error.localizedDescription, title: "Error while fetching restaurants")
            
            return false
        }
    }
}
