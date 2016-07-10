//
//  MealsCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - MealsCoordinatorDelegate Protocol

protocol MealsCoordinatorDelegate: class, ErrorSendingType {
    
}

// MARK: - MealsCoordinator

final class MealsCoordinator: SubCoordinator {
    
    // MARK: - MealsCoordinatorDelegate Declaration
    
    weak var coordinatorDelegate: MealsCoordinatorDelegate?
    
    // MARK: - NavigationController Declaration
    
    private let navigationController: UINavigationController
    
    // MARK: - ViewContoller Declaration
    
    private let mealsTableViewController = UITableViewController()
    
    // MARK: - MealsCoordinator Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Coordinator Methods
    
    func start() {
        navigationController.pushViewController(mealsTableViewController, animated: false)
    }
}