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

    /// MARK: - AuthenticationViewControllerDelegate
    
    weak var delegate: AuthenticationViewControllerDelegate?
    
    /// MARK: - TextField Declarations
    
    let emailTextField:    UITextField
    let passwordTextField: UITextField
    let usernameTextField: UITextField
    
    /// MARK: - AuthenticationAction
    
    let action: AuthenticationAction
    
    /// MARK: - init()
    
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
    
    /// MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setTextFields()
        view.backgroundColor = BackgroundColor.Red.color
    }
    
    /// MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("resturnnnnnnnnnn")
        switch action {
        case .Login:  delegate?.login(self)
        case .SignUp: delegate?.signUp(self)
        }
//        switch textField {
//        case emailTextField:
//            <#code#>
//        case passwordTextField:
//        case usernameTextField: break
//        }
        return true
    }
    
    
    /// MARK: - Set View Properties
    
    private func setTextFields() {
        
        emailTextField.backgroundColor    = BackgroundColor.Blue.color
        passwordTextField.backgroundColor = BackgroundColor.LightGray.color
        usernameTextField.backgroundColor = BackgroundColor.Cyan.color
        
        emailTextField.becomeFirstResponder()
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(usernameTextField)

        emailTextField.snp_makeConstraints { make in
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(view).multipliedBy(AuthenticationEmailTextFieldFrame.WidthToViewFactor.value)
            make.height.equalTo(view).multipliedBy(AuthenticationEmailTextFieldFrame.HeightToViewFactor.value)
            make.top.equalTo(view).offset(view.bounds.height * AuthenticationEmailTextFieldFrame.TopToViewFactor.value)
        }
        
        passwordTextField.snp_makeConstraints { make in
            make.width.equalTo(emailTextField)
            make.centerX.equalTo(emailTextField)
            make.top.equalTo(emailTextField.snp_bottom)
            make.height.equalTo(emailTextField)
        }
        
        if action == .SignUp {
            usernameTextField.snp_makeConstraints { make in
                make.width.equalTo(emailTextField)
                make.centerX.equalTo(emailTextField)
                make.top.equalTo(passwordTextField.snp_bottom)
                make.height.equalTo(emailTextField)
            }
        }
        
    }
    
    private func setTitle() {
        switch action {
        case .Login:  title = ViewControllerTitle.Login.title
        case .SignUp: title = ViewControllerTitle.SignUp.title
        }
    }
}
