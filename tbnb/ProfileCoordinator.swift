//
//  ProfileCoordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    let presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        
    }
}

protocol RemoteContentProviding {
    associatedtype Content
    
    func fetchContent(completion: Result<Content> -> Void)
    func viewControllerForContent(content: Result<Content>) -> UIViewController
}

