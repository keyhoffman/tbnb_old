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

class ApplicationCoordinator: Coordinator, AuthenticationCoordinatorDelegate, TabBarCoordinatorDelegate {
    
    /// MARK: - UIWindow
    
    let window: UIWindow
    
    /// MARK: - Sub-Coordinator Declarations
    
    let authenticationCoordinator: AuthenticationCoordinator
    let tabBarCoordinator:         TabBarCoordinator
    
    /// MARK: - ApplicationCoordinator Initializer
    
    init(window: UIWindow) {
        self.window = window
        
        self.authenticationCoordinator = AuthenticationCoordinator(window: self.window)
        self.tabBarCoordinator         = TabBarCoordinator(window: self.window)
        
        self.authenticationCoordinator.delegate = self
        self.tabBarCoordinator.delegate         = self
    }
    
    /// MARK: - Coordinator Methods
    
    func start() {
        try! FIRAuth.auth()?.signOut()
        if let _ = checkCurrentUser() { tabBarCoordinator.start() }
        else                          { authenticationCoordinator.start() }
    }
    
    /// MARK: - AuthenticationCoordinatorDelegate Methods
    
    func userHasBeenLoggedOut(sender: AuthenticationCoordinator) {
        fatalError("WFT")
    }
    
    func userHasBeenAuthenticated(authenticatedUser user: User, sender: AuthenticationCoordinator) {
        print("-- authenticatedUserDump --")
        dump(user)
    }
    
    /// MARK: - TabBarCoordinatorDelegate Methods
    
    func userHasRequestedLogOut(requestingUser user: User, sender: TabBarCoordinator) {
        print("-- requestingUserDump --")
        dump(user)
    }
    
}

func checkCurrentUser() -> FIRUser? { return FIRAuth.auth()?.currentUser }











