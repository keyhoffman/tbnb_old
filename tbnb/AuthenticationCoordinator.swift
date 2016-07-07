//
//  AuthenticationCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/5/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationCoordinator: Coordinator, OpeningViewControllerDelegate, AuthenticationViewControllerDelegate {
    
    let window: UIWindow
    let rootViewController = UINavigationController()
    
    private let openingViewController: OpeningViewController
    private let signUpViewController:  AuthenticationViewController
    private let loginViewController:   AuthenticationViewController
    
        
    init(window: UIWindow) {
        self.window = window
        
        self.openingViewController = OpeningViewController()
        self.signUpViewController  = AuthenticationViewController(authenticationAction: .SignUp)
        self.loginViewController   = AuthenticationViewController(authenticationAction: .Login)
        
        self.openingViewController.delegate = self
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        rootViewController.pushViewController(openingViewController, animated: false)
    }
    
    /// MARK: - AuthenticationViewControllerDelegate Methods
    
    func signUp(sender: AuthenticationViewController) {
        print("SIGN UP")
    }
    
    func login(sender: AuthenticationViewController) {
        print("LOGIN")
    }
    
    /// MARK: - OpeningViewControllerDelegate Methods
    
    func navigateToLoginButtonPressed(sender: OpeningViewController) {
        rootViewController.pushViewController(loginViewController, animated: true)
    }
    
    func navigateToSignUpButtonPressed(sender: OpeningViewController) {
        rootViewController.pushViewController(signUpViewController, animated: true)
    }
}
