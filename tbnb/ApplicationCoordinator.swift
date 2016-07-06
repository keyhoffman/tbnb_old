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

protocol Coordinator {
    func start()
}

/// TODO: Add delegates for coordinators
/// delegates allow viewControllers to send information to the coordinators

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    
    let authenticationCoordinator: AuthenticationCoordinator
    let tabBarCoordinator:         TabBarCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.authenticationCoordinator = AuthenticationCoordinator(window: self.window)
        self.tabBarCoordinator         = TabBarCoordinator(window: self.window)
    }
    
    func start() {
        if let _ = checkCurrentUser() { tabBarCoordinator.start() }
        else                          { authenticationCoordinator.start() }
    }
    
}

func checkCurrentUser() -> FIRUser? { return FIRAuth.auth()?.currentUser }











