//
//  ProfileCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - ProfileCoordinator Delegate

protocol ProfileCoordinatorDelegate: class, ErrorSendingType {
    
}

/// MARK: - ProfileCoordinator

final class ProfileCoordinator: Coordinator {
    
    /// MARK: - SearchCoordinatorDelegate Declaration
    
    weak var delegate: ProfileCoordinatorDelegate?
    
    /// MARK: - NavigationController Declaration
    
    private let navigationController: UINavigationController
    
    /// MARK: - ViewContoller Declaration
    
    private let profileTableViewController = UITableViewController()
    
    /// MARK: - SearchCoordinator Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// MARK: - Coordinator Methods
    
    func start() {
        navigationController.pushViewController(profileTableViewController, animated: false)
    }
}


