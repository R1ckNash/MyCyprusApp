//
//  ScreenViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation
import Combine


final class ScreenViewModel: ObservableObject {
    
    //MARK: - Publishers
    @Published var isActiveAlert: Bool = false
    
    //MARK: - Properties
    private var subscriptions: [AnyCancellable] = []
    var alertItem: AlertItem? = nil
    
    init() {
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Init")
        #endif
    }
    
    deinit {
        subscriptions.removeAll()
        
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Deinit")
        #endif
    }
    
    // MARK: Actions
    @MainActor
    public func set(alert: AlertItem) {
        self.alertItem = alert
        self.isActiveAlert = true
    }
}
