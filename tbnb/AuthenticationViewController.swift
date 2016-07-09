//
//  AuthenticationViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import SnapKit

/// MARK: - AuthenticationViewControllerDelegate Protocol

protocol AuthenticationViewControllerDelegate: class {
    var enteredEmail:    String? { get set }
    var enteredPassword: String? { get set }
    var enteredUsername: String? { get set }
    
    func signUp(sender: AuthenticationViewController)
    func login(sender: AuthenticationViewController)
}

/// MARK: - AuthenticationViewController

final class AuthenticationViewController: UIViewController, UITextFieldDelegate {

    /// MARK: - AuthenticationViewControllerDelegate
    
    weak var delegate: AuthenticationViewControllerDelegate?
    
    /// MARK: - TextField Declarations
    
    private let emailTextField    = AuthTextField.Email.textField
    private let passwordTextField = AuthTextField.Password.textField
    private let usernameTextField = AuthTextField.Username.textField
    
    /// MARK: - AuthenticationAction
    
    private let action: AuthenticationAction
    
    /// MARK: - AuthenticationViewController Initializer
    
    init(authenticationAction action: AuthenticationAction) {
        self.action = action
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFields()
        view.backgroundColor = BackgroundColor.Red.color
        title = action.titleValue
    }
    
    /// MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        if text.isEmpty { return false }
        switch textField {
        case emailTextField:
            delegate?.enteredEmail = text
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            passwordTextField.hidden = false
        case passwordTextField:
            delegate?.enteredPassword = text
            switch action {
            case .Login: delegate?.login(self)
            case .SignUp:
                passwordTextField.resignFirstResponder()
                usernameTextField.becomeFirstResponder()
                usernameTextField.hidden = false
            }
        case usernameTextField:
            delegate?.enteredUsername = text
            delegate?.signUp(self)
        default: fatalError("Invalid textfield")
        }
        return true
    }
    
    
    /// MARK: - Set View Properties
    
    private func setTextFields() {
        
        emailTextField.backgroundColor    = BackgroundColor.Blue.color
        passwordTextField.backgroundColor = BackgroundColor.LightGray.color
        usernameTextField.backgroundColor = BackgroundColor.Cyan.color
        
        emailTextField.placeholder    = AuthTextField.Email.placeholder
        passwordTextField.placeholder = AuthTextField.Password.placeholder
        usernameTextField.placeholder = AuthTextField.Username.placeholder
        
        emailTextField.delegate    = self
        passwordTextField.delegate = self
        usernameTextField.delegate = self
        
        emailTextField.becomeFirstResponder()
        
        passwordTextField.hidden = true
        usernameTextField.hidden = true
        
        passwordTextField.secureTextEntry = true
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(usernameTextField)

        emailTextField.snp_makeConstraints { make in
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(view).multipliedBy(AuthTextField.Frame.WidthToViewWidthFactor.value)
            make.height.equalTo(view).multipliedBy(AuthTextField.Frame.HeightToViewHeightFactor.value)
            make.top.equalTo(view).offset(view.bounds.height * AuthTextField.Frame.TopToViewTopFactor.value)
        }
        
        passwordTextField.snp_makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.centerX.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp_bottom)
            make.height.equalTo(emailTextField)
        }
        
        usernameTextField.snp_makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.centerX.equalTo(emailTextField)
            make.top.equalTo(passwordTextField.snp_bottom)
            make.height.equalTo(emailTextField)
        
        }
        
    }
    
}
