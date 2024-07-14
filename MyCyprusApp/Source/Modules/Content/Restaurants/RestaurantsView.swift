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
                                RestaurantItemView(item: item)
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
                        
                    } label: {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.blue)
                    }
                }
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
