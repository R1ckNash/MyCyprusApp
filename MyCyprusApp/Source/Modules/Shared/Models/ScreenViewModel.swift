//
//  ScreenViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation


final class ScreenViewModel: ObservableObject {
    
    //MARK: - Publishers
    @Published var isActiveAlert: Bool = false
    @Published var isActiveToast: Bool = false
    
    //MARK: - Properties
    var alertItem: AlertItem? = nil
    var toastItem: ToastItem? = nil
    
    init() {
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Init")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Deinit")
        #endif
    }
    
    // MARK: Actions
    @MainActor
    public func setAlert(alert: AlertItem) {
        self.alertItem = alert
        self.isActiveAlert = true
    }
    
    @MainActor
    public func setToast(toast: ToastItem) {
        self.toastItem = toast
        self.isActiveToast = true
    }
}
