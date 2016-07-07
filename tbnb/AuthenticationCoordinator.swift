//
//  AuthenticationCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/5/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AuthenticationCoordinator: Coordinator, OpeningViewControllerDelegate, AuthenticationViewControllerDelegate {
    
    /// MARK: - Root Properties
    
    let window: UIWindow
    let rootViewController = UINavigationController()
    
    /// MARK: ViewController Declarations
    
    private let openingViewController: OpeningViewController
    private let signUpViewController:  AuthenticationViewController
    private let loginViewController:   AuthenticationViewController
    
    /// MARK: AuthenticationViewControllerDelegate Variables
    
    var enteredEmail:    String?
    var enteredPassword: String?
    var enteredUsername: String?
    
    /// MARK: - AuthenticationCoordinator Initializer
    
    init(window: UIWindow) {
        self.window = window
        
        self.openingViewController = OpeningViewController()
        self.signUpViewController  = AuthenticationViewController(authenticationAction: .SignUp)
        self.loginViewController   = AuthenticationViewController(authenticationAction: .Login)
        
        self.openingViewController.delegate = self
        self.signUpViewController.delegate  = self
        self.loginViewController.delegate   = self
    }
    
    /// MARK: - Coordinator Methods
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        rootViewController.pushViewController(openingViewController, animated: false)
    }
    
    /// MARK: - AuthenticationViewControllerDelegate Methods
    
    func signUp(sender: AuthenticationViewController) {
        guard let email = enteredEmail, let password = enteredPassword, let username = enteredUsername else { return }
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { user, error in
            if let error = error {
                print(error.localizedDescription)
                return
//                fatalError(error.localizedDescription)
            }
            guard let user = user else { return }
            let changeRequest = user.profileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChangesWithCompletion { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
//                    fatalError(error.localizedDescription)
                }
                let user = User(key: user.uid, name: username, email: email)
                user.sendToFB()
                return
            }
        }
    }
    
    func login(sender: AuthenticationViewController) {
        guard let email = enteredEmail, let password = enteredPassword else { return }
        FIRAuth.auth()?.signInWithEmail(email, password: password) { user, error in
            if let error = error {
                print(error.localizedDescription)
                return
//                fatalError(error.localizedDescription)
            }
        }
    }
    
    /// MARK: - OpeningViewControllerDelegate Methods
    
    func navigateToLoginButtonPressed(sender: OpeningViewController) {
        rootViewController.pushViewController(loginViewController, animated: true)
    }
    
    func navigateToSignUpButtonPressed(sender: OpeningViewController) {
        rootViewController.pushViewController(signUpViewController, animated: true)
    }
}
