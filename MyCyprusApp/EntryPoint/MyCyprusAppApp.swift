//
//  MyCyprusAppApp.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI

@main
struct MyCyprusAppApp: App {
    
    @StateObject var model: RestaurantsViewModel = RestaurantsViewModel()
    
    var body: some Scene {
        WindowGroup {
            RestaurantsView(model: model)
                .preferredColorScheme(.light)
        }
    }
}
