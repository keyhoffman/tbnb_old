//
//  TabBarCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/5/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController = UITabBarController()
    
    let searchNavigationContoller  = UINavigationController()
    let mealsNavigationContoller   = UINavigationController()
    let profileNavigationContoller = UINavigationController()
    
    let searchCoordinator:  SearchCoordinator
    let mealsCoordinator:   MealsCoordinator
    let profileCoordinator: ProfileCoordinator
    
    
    
    init(window: UIWindow) {
        self.window = window
        
        let viewControllers = [searchNavigationContoller, mealsNavigationContoller, profileNavigationContoller]
        
        self.rootViewController.setViewControllers(viewControllers, animated: false)
        
        self.searchCoordinator  = SearchCoordinator(presenter: searchNavigationContoller)
        self.mealsCoordinator   = MealsCoordinator(presenter: mealsNavigationContoller)
        self.profileCoordinator = ProfileCoordinator(presenter: profileNavigationContoller)
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        searchCoordinator.start()
        mealsCoordinator.start()
        profileCoordinator.start()
    }
}
