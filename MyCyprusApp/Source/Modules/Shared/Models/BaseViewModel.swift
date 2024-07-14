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
        print("DEBUG: ", String(describing: self.self), " - Init")
        #endif
    }
    
    deinit {
        subscriptions.removeAll()
        
        #if DEBUG
        print("DEBUG: ", String(describing: self.self), " - Deinit")
        #endif
    }
    
    //MARK: - Actions
    func load() async {
        
    }
    
    
    // MARK: Error handle's
    func handle(error message: String, title: String, action: (() -> Void)? = nil) {
        self.screenModel.set(alert: .init(title: message, message: title))
        
        //self.screenModel.set(alert: .init(message.localized(), title: title.localized()) localization
    }
}
