//
//  AuthenticationCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/5/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit


enum Result<T> {
//    case Success(@autoclosure () -> T) //// GAYYYYYY
    case Failure(ErrorType)
}

func re(@autoclosure r: Void -> Void) {
    
}

protocol OpeningViewControllerDelegate: class {
    var loginButton:  UIBarButtonItem { get }
    var signUpButton: UIBarButtonItem { get }
    
    func loginButtonPressed(sender: MyViewController)
    func signUpButtonPressed(sender: UIBarButtonItem)
}

class AuthenticationCoordinator: Coordinator, OpeningViewControllerDelegate {
    
    let window: UIWindow
    let rootViewController = UINavigationController()
    
    private let openingViewController: MyViewController
    private let signUpViewController:  MyViewController
    private let loginViewController:   MyViewController
    
    let loginButton:  UIBarButtonItem
    let signUpButton: UIBarButtonItem
    
    init(window: UIWindow) {
        self.window = window
        
        self.openingViewController = MyViewController()
        self.signUpViewController  = MyViewController()
        self.loginViewController   = MyViewController()
        
        self.loginButton = UIBarButtonItem(title: "Login", style: .Plain, target: nil, action: #selector(AuthenticationCoordinator.loginButtonPressed(_:)))
        self.signUpButton = UIBarButtonItem(title: "Sign Up", style: .Plain, target: nil, action: #selector(AuthenticationCoordinator.signUpButtonPressed(_:)))
        
        self.openingViewController.title = "OPEN"
        self.openingViewController.view.backgroundColor = BackgroundColor.LightGray.color
        self.openingViewController.navigationItem.rightBarButtonItem = loginButton
        self.openingViewController.navigationItem.leftBarButtonItem  = signUpButton
        self.openingViewController.delegate = self
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        rootViewController.pushViewController(openingViewController, animated: true)
    }
    
    @objc func loginButtonPressed(sender: MyViewController) {
        print("Login")
    }
    
    @objc func signUpButtonPressed(sender: UIBarButtonItem) {
        print("Sign Up")
    }
}
