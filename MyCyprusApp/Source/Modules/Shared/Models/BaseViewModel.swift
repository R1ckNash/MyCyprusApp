//
//  BaseViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation

@MainActor
class BaseViewModel {
    
    //MARK: - Publishers
    @Published var activity: Bool = false
    
    //MARK: - Properties
    private(set) var screenModel: ScreenViewModel
    
    // MARK: Calculated Properties
    var api: Api {
        Api.shared
    }

    //MARK: - Life Cycle
    init() {
        screenModel = .init()
        
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Init Base Model")
        #endif
    }
    
    deinit {
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Deinit Base Model")
        #endif
    }
    
    //MARK: - Actions
    func load() async -> Bool {
        await startLoadingAsync()
        let result = await loading()
        await stopLoadingAsync()
        
        return result
    }
    
    func loading() async -> Bool {
        return true
    }
    
    private func startLoading() {
        activity = true
        
        #if DEBUG
        print("StartLoading")
        #endif
    }
    
    func startLoadingAsync() async {
        startLoading()
    }
    
    private func stopLoading() {
        activity = false
        
        #if DEBUG
        print("StopLoading")
        #endif
    }
    
    func stopLoadingAsync() async {
        stopLoading()
    }
    
    // MARK: Error handle's
    func handle(error message: String, title: String) {
        self.screenModel.setAlert(alert: .init(title: message, message: title))
    }
    
    func handle(error message: String) {
        self.screenModel.setToast(toast: .init(message: message))
    }

}
