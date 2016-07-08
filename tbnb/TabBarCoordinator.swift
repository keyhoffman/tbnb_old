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

class TabBarCoordinator: Coordinator, MealsCoordinatorDelegate, AddMealCoordinatorDelegate, ProfileCoordinatorDelegate {
    
    /// MARK: - TabBarCoordinatorDelegate Declaration
    
    weak var delegate: TabBarCoordinatorDelegate?
    
    /// MARK: - Root Property Declarations
    
    private let window: UIWindow
    private let rootViewController = UITabBarController()
    
    /// MARK: - NavigationController Declarations
    
    private let addMealsNavigationContoller = TabBarNavigationController.AddMeal.navigationController
    private let mealsNavigationContoller    = TabBarNavigationController.Meals.navigationController
    private let profileNavigationContoller  = TabBarNavigationController.Profile.navigationController
    
    /// MARK: - Sub-Coordinator Declarations
    
    private let addMealCoordinator: AddMealCoordinator
    private let mealsCoordinator:   MealsCoordinator
    private let profileCoordinator: ProfileCoordinator
    
    /// MARK: - TabBarCoordinator Initializer
    
    init(window: UIWindow) {
        self.window = window
        
        let viewControllers = [addMealsNavigationContoller, mealsNavigationContoller, profileNavigationContoller]
        
        rootViewController.setViewControllers(viewControllers, animated: false)
        
        addMealCoordinator = AddMealCoordinator(navigationController: addMealsNavigationContoller)
        mealsCoordinator   = MealsCoordinator(navigationController: mealsNavigationContoller)
        profileCoordinator = ProfileCoordinator(navigationController: profileNavigationContoller)
        
        setNavigationControllerTabBarItems()
        
        mealsCoordinator.delegate   = self
        addMealCoordinator.delegate = self
        profileCoordinator.delegate = self
    }
    
    /// MARK: - Coordinator Methods
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        addMealCoordinator.start()
        mealsCoordinator.start()
        profileCoordinator.start()
    }
    
    /// MARK: - Set NavigationController TabBarItems
    
    private func setNavigationControllerTabBarItems() {
        addMealsNavigationContoller.tabBarItem = UITabBarItem(title: TabBarNavigationController.AddMeal.tabBarItemTitle, image: TabBarNavigationController.AddMeal.tabBarItemImage, tag: TabBarNavigationController.AddMeal.tabBarItemTag)
        mealsNavigationContoller.tabBarItem    = UITabBarItem(title: TabBarNavigationController.Meals.tabBarItemTitle, image: TabBarNavigationController.Meals.tabBarItemImage, tag: TabBarNavigationController.Meals.tabBarItemTag)
        profileNavigationContoller.tabBarItem  = UITabBarItem(title: TabBarNavigationController.Profile.tabBarItemTitle, image: TabBarNavigationController.Profile.tabBarItemImage, tag: TabBarNavigationController.Profile.tabBarItemTag)
    }
}
