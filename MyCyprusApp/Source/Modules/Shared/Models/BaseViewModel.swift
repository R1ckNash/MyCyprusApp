//
//  BaseViewModel.swift
//  MyCyprusApp
//
//  Created by Ilia Liasin on 14/07/2024.
//

import Foundation
import Combine

@MainActor
class BaseViewModel {
    
    //MARK: - Publishers
    @Published var activity: Bool = false
    
    //MARK: - Properties
    private(set) var screenModel: ScreenViewModel
    
    var subscriptions: Set<AnyCancellable>
    
    // MARK: Calculated Properties
    var api: Api {
        Api.shared
    }

    //MARK: - Life cycle
    init() {
        screenModel = .init()
        subscriptions = []
        
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Init Base Model")
        #endif
    }
    
    deinit {
        subscriptions.removeAll()
        
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
    
    func startLoading() {
        activity = true
        
        #if DEBUG
        print("StartLoading")
        #endif
    }
    
    func startLoadingAsync() async {
        startLoading()
    }
    
    func stopLoading() {
        activity = false
        
        #if DEBUG
        print("StopLoading")
        #endif
    }
    
    func stopLoadingAsync() async {
        stopLoading()
    }
    
    
    // MARK: Error handle's
    func handle(error message: String, title: String, action: (() -> Void)? = nil) {
        self.screenModel.set(alert: .init(title: message, message: title))
        
        //self.screenModel.set(alert: .init(message.localized(), title: title.localized()) localization
    }
}
