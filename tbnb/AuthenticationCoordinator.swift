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

/// MARK: - AuthenticationCoordinatorDelegate Protocol

protocol AuthenticationCoordinatorDelegate: class, ErrorSendingType {
    func userHasBeenAuthenticated(authenticatedUser user: User, sender: AuthenticationCoordinator)
    func userHasBeenLoggedOut(sender: AuthenticationCoordinator)
}

/// MARK: - Authenticator Protocol

protocol Authenticator {
    func checkCurrentUser() -> User?
}

extension Authenticator where Self: AuthenticationCoordinator {
    func checkCurrentUser() -> User? {
        let auth = FIRAuth.auth()
        guard let key = auth?.currentUser?.uid, email = auth?.currentUser?.email, username = auth?.currentUser?.displayName  else { return nil }
        return User(key: key, username: username, email: email)
    }
}

/// MARK: - AuthenticationAction

enum AuthenticationAction {
    case Login
    case SignUp
    
    var titleValue: String {
        switch self {
        case .Login:  return ViewControllerTitle.Login.title
        case .SignUp: return ViewControllerTitle.SignUp.title
        }
    }
}

/// MARK: - AuthenticationCoordinator

final class AuthenticationCoordinator: Coordinator, Authenticator, OpeningViewControllerDelegate, AuthenticationViewControllerDelegate {
    
    /// MARK: - AuthenticationCoordinatorDelegate Declaration
    
    weak var delegate: AuthenticationCoordinatorDelegate?
    
    /// MARK: - Root Property Declarations
    
    private let window: UIWindow
    private let rootViewController = UINavigationController()
    
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
        
        openingViewController = OpeningViewController()
        signUpViewController  = AuthenticationViewController(authenticationAction: .SignUp)
        loginViewController   = AuthenticationViewController(authenticationAction: .Login)
        
        openingViewController.delegate = self
        signUpViewController.delegate  = self
        loginViewController.delegate   = self
    }
    
    /// MARK: - Coordinator and Authenticator Methods
    
    func start() {
        if let user = checkCurrentUser() { print("-- UserDump --"); dump(user); delegate?.userHasBeenAuthenticated(authenticatedUser: user, sender: self) }
        else {
            print("NO USER!")
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            rootViewController.pushViewController(openingViewController, animated: false)
        }
    }
    
    /// MARK: - AuthenticationViewControllerDelegate Methods
    
    func signUp(sender: AuthenticationViewController) {
        guard let email = enteredEmail, let password = enteredPassword, let username = enteredUsername else { return }
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { user, error in
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.anErrorHasOccurred(error, sender: self)
                return
            }
            guard let user = user else { return }
            let changeRequest = user.profileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChangesWithCompletion { error in
                if let error = error {
                    print(error.localizedDescription)
                    self.delegate?.anErrorHasOccurred(error, sender: self)
                    return
                }
                let logggedInUser = User(key: user.uid, username: username, email: email)
                logggedInUser.sendToFB { result in
                    switch result {
                    case .Failure(let error): self.delegate?.anErrorHasOccurred(error, sender: self)
                    case .Success(let user):  self.delegate?.userHasBeenAuthenticated(authenticatedUser: user, sender: self)
                    }
                }
                return
            }
        }
    }
    
    func login(sender: AuthenticationViewController) {
        guard let email = enteredEmail, let password = enteredPassword else { return }
        FIRAuth.auth()?.signInWithEmail(email, password: password) { user, error in
            if let error = error {
                print(error.localizedDescription)
                self.delegate?.anErrorHasOccurred(error, sender: self)
                return
            }
            guard let user = user, let email = user.email, let username = user.displayName else { return }
            let loggedInUser = User(key: user.uid, username: username, email: email)
            self.delegate?.userHasBeenAuthenticated(authenticatedUser: loggedInUser, sender: self)
            return
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
