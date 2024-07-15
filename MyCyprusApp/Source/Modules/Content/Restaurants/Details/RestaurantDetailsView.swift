//
//  RestaurantDetailsView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 15/07/2024.
//

import SwiftUI

struct RestaurantDetailsView: View {
    
    @ObservedObject var model: RestaurantDetailsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScreenView(model: model.screenModel) {
            ScrollView {
                if model.activity {
                    HStack {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(.circular)
                        Spacer()
                    }
                } else {
                    Section {
                        if let restaurant = model.restaurant {
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(restaurant.photoUrls, id: \.self) { photo  in
                                        Image(systemName: photo)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: UIScreen.main.bounds.width - 32, height: 200)
                                            .background(.blue)
                                            .clipped()
                                            .cornerRadius(16)
                                    }
                                }
                            }
                        }
                    }
                    
                    Group {
                        Section {
                            if let restaurant = model.restaurant {
                                NameAndRateView(item: restaurant)
                            }
                        }
                        
                        Section {
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Description")
                                    .font(.title2.bold())
                                
                                if let restaurant = model.restaurant {
                                    Text(restaurant.formattedDetailedInfo)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(16)
                }
            }
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .font(.headline.bold())
                            .foregroundStyle(.black)
                    }
                }
            }
            .background {
                Color(uiColor: .systemGroupedBackground)
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            Task {
                await model.load()
            }
        }
    }
}


#Preview {
    let model = RestaurantDetailsViewModel()
    model.set(restaurant: .preview)
    return RestaurantDetailsView(model: model)
}
