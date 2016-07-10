//
//  Coordinator.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - Coordinator Protocol

protocol Coordinator: class {
    func start()
}

// MARK: - SubCoordinator Protocol
// TODO: - Make the types work!!!!

protocol SubCoordinator: Coordinator {
    //    associatedtype CoordinatorDelegate: class
    //    weak var coordinatorDelegate: CoordinatorDelegate? { get set }
}
