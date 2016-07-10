//
//  FirebaseTypes.swift
//  tbnb
//
//  Created by Key Hoffman on 7/7/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

// MARK: - FBDictionary

typealias FBDictionary = [String : AnyObject]

// MARK: - FirebaseType Protocol

protocol FBType {
    static var Path: String { get }
}

// MARK: - FirebaseType Protocol Extension

extension FBType { var RootRef: FIRDatabaseReference { return FIRDatabase.database().reference() } }

