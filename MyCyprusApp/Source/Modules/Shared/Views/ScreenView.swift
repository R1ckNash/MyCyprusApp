//
//  ScreenView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI

struct ScreenView<Content>: View where Content: View {
    
    @ObservedObject var model: ScreenViewModel
    
    var content: () -> Content
    
    init(model: ScreenViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.model = model
        self.content = content
    }
    
    var body: some View {
        content()
            .alert(model.alertItem?.title ?? "", isPresented: $model.isActiveAlert) {
                Button("OK") { }
            } message: {
                Text(model.alertItem?.message ?? "")
            }
    }
}

#Preview {
    ScreenView(model: .init()) {
        Text("Text")
    }
}
