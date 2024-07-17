//
//  RestaurantItemView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI
import Kingfisher

struct RestaurantItemView: View {
    
    @EnvironmentObject var model: RestaurantsViewModel
    var item: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            KFImage(URL(string: item.photoUrl))
                .placeholder {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 160)
                        .cornerRadius(16)
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 160)
                .clipped()
                .cornerRadius(16, corners: [.topLeft, .topRight])
            
            footer
                .padding([.horizontal, .bottom])
        }
        .background {
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color(.white))
        }
    }
    
    var footer: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(item.name)")
                    .foregroundStyle(.black)
                Spacer()
                Button {
                    model.toggleFavorite(for: item.id)
                } label: {
                    Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.cyan)
                        .font(.title2)
                }
            }
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundStyle(.cyan)
                
                Text(item.formattedRate)
                    .foregroundStyle(.black)
                
                Text(item.formattedAverageCheck)
                    .foregroundStyle(.gray)
                
                Text(item.formattedCuisines)
                    .foregroundStyle(.gray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            .font(.subheadline)
        }
    }
}

struct RoundedCorners: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorners(radius: radius, corners: corners))
    }
}

#Preview {
    ZStack {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()
        VStack {
            RestaurantItemView(item: .preview)
                .environmentObject(RestaurantsViewModel())
        }
    }
}
