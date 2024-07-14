//
//  RestaurantsView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI

struct RestaurantsView: View {
    
    @ObservedObject var model: RestaurantsViewModel
    
    var body: some View {
        ScreenView(model: model.screenModel) {
            ScrollView {
                LazyVStack {
                    ForEach(model.restaurants, id: \.id) { item in
                        RestaurantItemView()
                    }
                }
            }
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            Task {
               await model.load()
            }
        }
    }
}

//#Preview {
//    RestaurantsView()
//}
