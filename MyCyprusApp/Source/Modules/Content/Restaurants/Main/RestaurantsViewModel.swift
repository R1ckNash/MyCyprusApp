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
    @Published var favoriteRestaurantIds: Set<Int> = []
    @Published var isFavoriteModeOn: Bool = false {
        didSet {
            updateFilteredRestaurants()
        }
    }
    
    //MARK: - Properties
    private(set) lazy var details: RestaurantDetailsViewModel = .init()
    
    var filteredRestraunts: [Restaurant] {
        isFavoriteModeOn 
        ? restaurants.filter { favoriteRestaurantIds.contains($0.id) }
        : restaurants
    }
    
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
    
    func showFavorite() {
        isFavoriteModeOn.toggle()
    }
    
    func contains(_ restaurant: Restaurant) -> Bool {
        favoriteRestaurantIds.contains(restaurant.id)
    }
    
    func toggleFavorite(for restaurant: Restaurant) {
        if let idx = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants[idx].isFavorite.toggle()
            updateFilteredRestaurants()
        }
    }
    
    //MARK: - Life Cycle
    override init() {
        super.init()
        
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Init")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Init")
        #endif
    }
    
    //MARK: - Private
    private func updateFilteredRestaurants() {
        favoriteRestaurantIds = Set(restaurants.filter { $0.isFavorite }.map { $0.id })
        print(favoriteRestaurantIds.count)
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
