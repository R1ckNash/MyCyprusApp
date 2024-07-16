//
//  RatingView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 16/07/2024.
//

import SwiftUI

struct RatingView: View {
    
    let rating: Float
    let maxRate = 5
    
    var offImage: Image?
    var onImage: Image = Image(systemName: "star.fill")
    
    let offColor: Color = Color(.systemGray4)
    let onColor: Color = .blue
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1 ..< maxRate + 1, id: \.self) { number in
                image(for: Float(number))
                    .foregroundStyle(number > Int(rating) ? offColor : onColor)
            }
        }
    }
    
    func image(for number: Float) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: 4)
}
