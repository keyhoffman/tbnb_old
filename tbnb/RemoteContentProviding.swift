//
//  RemoteContentProviding.swift
//  tbnb
//
//  Created by Key Hoffman on 7/8/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - RemoteContentProviding Protocol

//protocol RemoteContentProviding {
//    associatedtype Object: FirebaseSendable
//    
//    func fetchContent(completion: Result<Object, NSError> -> Void)
//    func viewControllerForContent(content: Result<Object, NSError>) -> UIViewController
//}
//
//
//class RemoteContentContainer<R: RemoteContentProviding>: UIViewController {
//    
//    let provider: R
//    
//    init(provider: R) {
//        self.provider = provider
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        provider.fetchContent { content in
//            let viewController = self.provider.viewControllerForContent(content)
//            self.addChildViewController(viewController)
//            self.view.addSubview(viewController.view)
//            viewController.view.frame = self.view.bounds
//            viewController.didMoveToParentViewController(self)
//        }
//    }
//}
//
//struct MealProvider: RemoteContentProviding {
//    
//    let ID: String
//    
//    func fetchContent(completion: Result<Meal, NSError> -> Void) {
////        load meal shit
//    }
//    
//    func viewControllerForContent(content: Result<Meal, NSError>) -> UIViewController {
//        switch content {
//        case .Success(let meal): dump(meal); return UIViewController()
//        case .Failure(let error): return ErrorViewController(errorMessage: "Could not load meals \n\n error:\n\(error.localizedDescription)")
//        }
//    }
//}

//protocol FBFetchedResultsControllerDelegate: class {
//    
//}
//
//class FBFetchedResultsController<T: FirebaseSendable>: RemoteContentProviding {
//    
//    weak var delegate: FBFetchedResultsControllerDelegate?
//    
//    func fetchContent(completion: Result<T, NSError> -> Void) {
//        
//    }
//    
//    func viewControllerForContent(content: Result<T, NSError>) -> UIViewController {
//        return UIViewController()
//    }
//}