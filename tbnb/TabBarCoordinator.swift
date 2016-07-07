//
//  TabBarCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/5/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - TabBarCoordinatorDelegate Protocol

protocol TabBarCoordinatorDelegate: class {
    func userHasRequestedLogOut(requestingUser user: User, sender: TabBarCoordinator)
}

/// MARK: - TabBarCoordinator

class TabBarCoordinator: Coordinator {
    
    /// MARK: - TabBarCoordinatorDelegate Declaration
    
    weak var delegate: TabBarCoordinatorDelegate?
    
    /// MARK: - Root Property Declarations
    
    let window: UIWindow
    let rootViewController = UITabBarController()
    
    /// MARK: - NavigationController Declarations
    
    let searchNavigationContoller  = UINavigationController()
    let mealsNavigationContoller   = UINavigationController()
    let profileNavigationContoller = UINavigationController()
    
    /// MARK: - Sub-Coordinator Declarations
    
    let searchCoordinator:  SearchCoordinator
    let mealsCoordinator:   MealsCoordinator
    let profileCoordinator: ProfileCoordinator
    
    /// MARK: - TabBarCoordinator Initializer
    
    init(window: UIWindow) {
        self.window = window
        
        let viewControllers = [searchNavigationContoller, mealsNavigationContoller, profileNavigationContoller]
        
        self.rootViewController.setViewControllers(viewControllers, animated: false)
        
        self.searchCoordinator  = SearchCoordinator(presenter: searchNavigationContoller)
        self.mealsCoordinator   = MealsCoordinator(presenter: mealsNavigationContoller)
        self.profileCoordinator = ProfileCoordinator(presenter: profileNavigationContoller)
    }
    
    /// /// MARK: - Coordinator Methods
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        searchCoordinator.start()
        mealsCoordinator.start()
        profileCoordinator.start()
    }
}
