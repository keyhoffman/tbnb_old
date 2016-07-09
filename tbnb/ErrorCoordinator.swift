//
//  ErrorCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/9/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - ErrorCoordinatorDelegate Protocol

protocol ErrorCoordinatorDelegate: class {
    func userHasAcknowledgedError(sender: ErrorCoordinator)
}

/// MARK: - ErrorCoordinator

class ErrorCoordinator: Coordinator, ErrorViewControllerDelegate {
    
    /// MARK: - ErrorCoordinatorDelegate Declaration
    
    weak var delegate: ErrorCoordinatorDelegate?
    
    /// MARK: - ViewController Declarations
    
    private let errorViewController:  ErrorViewController
    
    private let window: UIWindow
//    private let navigationController: UINavigationController
    
    /// MARK: - ErrorCoordinator Initializer
    
    init(window: UIWindow, errorType: ErrorType) {
        self.window = window
        self.errorViewController  = ErrorViewController(errorType: errorType)
//        self.navigationController = navigationController
    }
    
    /// MARK: - Coordinator Methods
    
    func start() {
        errorViewController.modalPresentationStyle = .Popover
        errorViewController.preferredContentSize   = ErrorViewControllerAttributes.View.preferredContentSize
        window.rootViewController = errorViewController
//        navigationController.presentViewController(errorViewController, animated: true, completion: nil)
    }
    
    /// MARK: - ErrorViewControllerDelegate Methods
    
    func userHasAcknowledgedError(sender: ErrorViewController) {
        delegate?.userHasAcknowledgedError(self)
    }

}