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

/// MARK: - Coordinator Protocol

protocol Coordinator {
    func start()
}

/// MARK: - ApplicationCoordinator

final class ApplicationCoordinator: Coordinator, AuthenticationCoordinatorDelegate, TabBarCoordinatorDelegate {
    
    /// MARK: - UIWindow
    
    private let window: UIWindow
    
    /// MARK: - Sub-Coordinator Declarations
    
    private let authenticationCoordinator: AuthenticationCoordinator
    private let tabBarCoordinator:         TabBarCoordinator
    
    /// MARK: - ApplicationCoordinator Initializer
    
    init(window: UIWindow) {
        self.window = window
        
        authenticationCoordinator = AuthenticationCoordinator(window: self.window)
        tabBarCoordinator         = TabBarCoordinator(window: self.window)
        
        authenticationCoordinator.delegate = self
        tabBarCoordinator.delegate         = self
    }
    
    /// MARK: - Coordinator Methods
    
    func start() {
        try! FIRAuth.auth()?.signOut() /// TODO: - delete this
        authenticationCoordinator.start()
    }
    
    /// MARK: - ErrorSendingType Methods
    
    func anErrorHasOccurred(error: ErrorType, sender: Coordinator) {
        <#code#>
    }
    
    /// MARK: - AuthenticationCoordinatorDelegate Methods
    
    func userHasBeenLoggedOut(sender: AuthenticationCoordinator) {
        fatalError("WFT")
    }
    
    func userHasBeenAuthenticated(authenticatedUser user: User, sender: AuthenticationCoordinator) {
        print("-- authenticatedUserDump --")
        dump(user)
        tabBarCoordinator.start()
    }
    
    /// MARK: - TabBarCoordinatorDelegate Methods
    
    func userHasRequestedLogOut(requestingUser user: User, sender: TabBarCoordinator) {
        print("-- requestingUserDump --")
        dump(user)
    }
    
}














