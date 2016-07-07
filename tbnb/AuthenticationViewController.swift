//
//  AuthenticationViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import SnapKit

protocol AuthenticationViewControllerDelegate: class {
    func signUp(sender: AuthenticationViewController)
    func login(sender: AuthenticationViewController)
}

enum AuthenticationAction {
    case Login, SignUp
}

class AuthenticationViewController: UIViewController, UITextFieldDelegate {

    weak var delegate: AuthenticationViewControllerDelegate?
    
    let emailTextField:    UITextField
    let passwordTextField: UITextField
    let usernameTextField: UITextField
    
    let action: AuthenticationAction
    
    init(authenticationAction action: AuthenticationAction) {
        self.action = action
        
        emailTextField    = UITextField()
        passwordTextField = UITextField()
        usernameTextField = UITextField()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setTextFields()
        view.backgroundColor = BackgroundColor.Red.color
    }
    
    private func setTextFields() {
        
        emailTextField.backgroundColor    = BackgroundColor.Blue.color
        passwordTextField.backgroundColor = BackgroundColor.LightGray.color
        usernameTextField.backgroundColor = BackgroundColor.Cyan.color
        
        emailTextField.becomeFirstResponder()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        switch action {
        case .SignUp: view.addSubview(usernameTextField)
        case .Login:  break
        }

        emailTextField.snp_makeConstraints { make in
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(100)
            make.height.equalTo(75)
        }
        
        passwordTextField.snp_makeConstraints { make in
            
        }
        
        usernameTextField.snp_makeConstraints { make in
            
        }
        
        
    }
    
    private func setTitle() {
        switch action {
        case .Login:  title = ViewControllerTitle.Login.title
        case .SignUp: title = ViewControllerTitle.SignUp.title
        }
    }
}
