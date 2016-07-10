//
//  SearchCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AddMealCoordinatorDelegate Protocol

protocol AddMealCoordinatorDelegate: class, ErrorSendingType {
    
}

// MARK: - SearchCoordinator

final class AddMealCoordinator: SubCoordinator {
    
    // MARK: - AddMealCoordinatorDelegate Declaration
    
    weak var coordinatorDelegate: AddMealCoordinatorDelegate?
    
    // MARK: - NavigationController Declaration
    
    private let navigationController: UINavigationController
    
    // MARK: - ViewContoller Declaration
    
    private let addMealViewController = UIViewController()

    // MARK: - SearchCoordinator Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Methods
    
    func start() {
        navigationController.pushViewController(addMealViewController, animated: false)
    }
}