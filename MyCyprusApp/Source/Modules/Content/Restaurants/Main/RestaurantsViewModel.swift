//
//  RestaurantsViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

@MainActor
final class RestaurantsViewModel: BaseViewModel, ObservableObject {
    
    //MARK: - Publishers
    @Published var restaurants: [Restaurant] = []
    
    //MARK: - Properties
    private(set) lazy var details: RestaurantDetailsViewModel = .init()
    
    //MARK: - Overrides
    override func load() async -> Bool {
        guard self.restaurants.isEmpty else { return true }
        
        return await super.load()
    }
    
    override func loading() async -> Bool {
        let result = await super.loading()
        
        let success = await self.restaurants()
        
        return result && success
    }
    
    //MARK: - Public
    func detailModel(for id: Int) -> RestaurantDetailsViewModel {
        details.set(id: id)
        return self.details
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
