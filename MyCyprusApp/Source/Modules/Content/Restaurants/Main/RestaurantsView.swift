//
//  RestaurantsView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI

struct RestaurantsView: View {
    
    @ObservedObject var model: RestaurantsViewModel
    
    @State var isFavoriteModeOn: Bool = false
    
    var body: some View {
        NavigationStack {
            ScreenView(model: model.screenModel) {
                ScrollView {
                    if model.activity {
                        HStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(.circular)
                                .frame(width: 150, height: 150)
                            Spacer()
                        }
                    } else {
                        LazyVStack {
                            ForEach(model.restaurants, id: \.id) { item in
                                NavigationLink(value: item) {
                                    RestaurantItemView(item: item)
                                        .padding(.horizontal)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Restaurants")
                .navigationBarTitleDisplayMode(.inline)
                .background {
                    Color(uiColor: .systemGroupedBackground)
                        .ignoresSafeArea()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isFavoriteModeOn.toggle()
                    } label: {
                        Image(systemName: isFavoriteModeOn ? "heart.fill" : "heart")
                            .foregroundStyle(.blue)
                    }
                }
            }
            .navigationDestination(for: Restaurant.self) { (value) in
                RestaurantDetailsView(model: self.model.detailModel(for: value.id))
            }
            .onAppear {
                Task {
                    await model.load()
                }
            }
        }
    }
}

#if DEBUG
struct RestaurantsView_PreviewView: View {
    @StateObject var model: RestaurantsViewModel = {
        let model = RestaurantsViewModel()
        
        return model
    }()
    
    var body: some View {
        NavigationStack {
            RestaurantsView(model: model)
                .onAppear {
                    Task {
                        await self.model.load()
                    }
                }
        }
        
    }
}

#Preview {
    RestaurantsView_PreviewView()
}
#endif
