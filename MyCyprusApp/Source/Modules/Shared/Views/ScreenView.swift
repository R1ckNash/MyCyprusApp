//
//  ScreenView.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import SwiftUI
import SimpleToast

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
            .simpleToast(isPresented: $model.isActiveToast, options: .init(alignment: .top, hideAfter: 1, modifierType: .slide)) {
                Label(model.toastItem?.message ?? "", systemImage: "x.circle")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    .padding(.top)
            }
    }
}

#Preview {
    ScreenView(model: .init()) {
        Text("Text")
    }
}
