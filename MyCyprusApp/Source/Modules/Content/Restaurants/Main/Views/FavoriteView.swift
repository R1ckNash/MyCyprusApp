//
//  FavoriteView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 16/07/2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @Binding var ids: Set<Int>
    @Binding var isFavoriteModeOn: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: isFavoriteModeOn ? "heart.fill" : "heart")
                .font(.title2)
            Text(String(ids.count))
                .font(.caption2)
                .foregroundStyle(isFavoriteModeOn ? .white : .cyan)
        }
        .foregroundStyle(.cyan)
    }
}

#Preview {
    FavoriteView(ids: .constant(Set([1, 2, 3])), isFavoriteModeOn: .constant(true))
}
