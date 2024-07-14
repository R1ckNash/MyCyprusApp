//
//  RestaurantItemView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI

struct RestaurantItemView: View {
    
    let item: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.red)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 160)
                .clipped()
            
            footer
        }
        .padding([.horizontal, .bottom])
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color(.white))
        }
    }
    
    var footer: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(item.name)")
                    .font(.title3)
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: "heart.fill")
                        .foregroundStyle(.blue)
                        .font(.title2)
                }
            }
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundStyle(.blue)
                Text(item.formattedRate)
                Text(item.formattedAverageCheck)
                    .foregroundStyle(.gray)
                Text(item.formattedCuisines)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()
        VStack {
            RestaurantItemView(item: .preview)
            //RestaurantItemView(item: .preview)
        }
    }
}
