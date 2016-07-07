//
//  OpeningViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import Foundation

protocol OpeningViewControllerDelegate: class {    
    func navigateToLoginButtonPressed(sender: OpeningViewController)
    func navigateToSignUpButtonPressed(sender: OpeningViewController)
}

class OpeningViewController: UIViewController {
    
    weak var delegate: OpeningViewControllerDelegate?
    
    let navigateToLoginButton:  UIBarButtonItem
    let navigateToSignUpButton: UIBarButtonItem
    
    init() {
        navigateToLoginButton  = UIBarButtonItem()
        navigateToSignUpButton = UIBarButtonItem()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func navigateToLoginViewController(sender: UIBarButtonItem) {
        delegate?.navigateToLoginButtonPressed(self)
    }
    
    func navigateToSignUpViewController(sender: UIBarButtonItem) {
        delegate?.navigateToSignUpButtonPressed(self)
    }
    
}
