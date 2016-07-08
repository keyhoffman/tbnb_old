//
//  OpeningViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import Foundation

/// MARK: - OpeningViewControllerDelegate Protocol

protocol OpeningViewControllerDelegate: class {    
    func navigateToLoginButtonPressed(sender: OpeningViewController)
    func navigateToSignUpButtonPressed(sender: OpeningViewController)
}

/// MARK: - OpeningViewController

class OpeningViewController: UIViewController {
    
    /// MARK: - OpeningViewControllerDelegate Declaration
    
    weak var delegate: OpeningViewControllerDelegate?
    
    /// MARK: - UIBarButtonItem Declarations
    
    private let navigateToLoginButton  =  UIBarButtonItem()
    private let navigateToSignUpButton = UIBarButtonItem()
    
    /// MARK: - OpeningViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ViewControllerTitle.Opening.title
        view.backgroundColor = BackgroundColor.LightGray.color
        
        navigateToLoginButton.target = self
        navigateToLoginButton.action = #selector(OpeningViewController.navigateToLoginViewController(_:))
        navigateToLoginButton.title  = ButtonTitle.Login.title
        
        navigateToSignUpButton.target = self
        navigateToSignUpButton.action = #selector(OpeningViewController.navigateToSignUpViewController(_:))
        navigateToSignUpButton.title  = ButtonTitle.SignUp.title
        navigationItem.rightBarButtonItem = navigateToLoginButton
        navigationItem.leftBarButtonItem  = navigateToSignUpButton
    }
    
    /// MARK: - Navigation Action Methods
    
    func navigateToLoginViewController(sender: UIBarButtonItem) {
        delegate?.navigateToLoginButtonPressed(self)
    }
    
    func navigateToSignUpViewController(sender: UIBarButtonItem) {
        delegate?.navigateToSignUpButtonPressed(self)
    }
    
}
