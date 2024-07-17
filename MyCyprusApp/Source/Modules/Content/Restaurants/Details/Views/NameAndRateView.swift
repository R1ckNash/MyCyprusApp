//
//  NameAndRateView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 16/07/2024.
//

import SwiftUI

struct NameAndRateView: View {
    
    let item: RestaurantDetailInfo
    @EnvironmentObject var restaurantsModel: RestaurantsViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(item.name)
                    .font(.title3.bold())
                HStack {
                    RatingView(rating: item.rate ?? 0.0)
                    Text(item.formattedRate)
                        .font(.title3.bold())
                        .foregroundStyle(.blue)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Button {
                    restaurantsModel.toggleFavorite(for: item.id)
                } label: {
                    Image(systemName: restaurantsModel.contains(item.id) ? "heart.fill" : "heart")
                        .font(.title2.bold())
                }
                Text(item.formattedDistance)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    NameAndRateView(item: .preview)
}
