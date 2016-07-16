//
//  ApplicationCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import Firebase

// MARK: - ApplicationCoordinator

final class ApplicationCoordinator: Coordinator, AuthenticationCoordinatorDelegate, TabBarCoordinatorDelegate, ErrorCoordinatorDelegate {
    
    // MARK: - UIWindow
    
    private let window: UIWindow
    
    // MARK: - Sub-Coordinator Declarations
    
    private let authenticationCoordinator: AuthenticationCoordinator
    private let tabBarCoordinator:         TabBarCoordinator
    private var errorCoordinator:          ErrorCoordinator?
    
    // MARK: - ApplicationCoordinator Initializer
    
    init(window: UIWindow) {
        self.window = window
        
        authenticationCoordinator = AuthenticationCoordinator(window: self.window)
        tabBarCoordinator         = TabBarCoordinator(window: self.window)
        
        authenticationCoordinator.coordinatorDelegate = self
        tabBarCoordinator.coordinatorDelegate         = self
    }
    
    // MARK: - Coordinator Methods
    
    func start() {
//        try! FIRAuth.auth()?.signOut() // TODO: - delete this
        authenticationCoordinator.start()
    }
    
    // MARK: - AuthenticationCoordinatorDelegate Methods
    
    func userHasBeenLoggedOut(sender: AuthenticationCoordinator) {
        fatalError("WFT")
    }
    
    func userHasBeenAuthenticated(authenticatedUser user: User, sender: AuthenticationCoordinator) {
        tabBarCoordinator.start()
    }
    
    // MARK: - TabBarCoordinatorDelegate Methods
    
    func userHasRequestedLogOut(requestingUser user: User, sender: TabBarCoordinator) {
        print("-- requestingUser Dump --")
        dump(user)
    }
    
    // MARK: - ErrorSendingType Methods
    
    func anErrorHasOccurred(error: ErrorType, sender: Coordinator) {
        errorCoordinator = ErrorCoordinator(window: window, errorType: error)
        errorCoordinator?.delegate = self
        errorCoordinator?.start()
    }
    
    // MARK: - ErrorCoordinatorDelegate Methods
    
    func userHasAcknowledgedError(sender: ErrorCoordinator) {
        print("userHasAcknowledgedError")
        print("-- ErrorCoordinatorDelegate Dump --")
        dump(sender)
        authenticationCoordinator.start()
    }
    
}














