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
// TODO: - Should RootRef be Static????

extension FBType { var RootRef: FIRDatabaseReference { return FIRDatabase.database().reference() } }

protocol ImageContainingType: FBType {
    var imagePath: String { get }
}

//let storage = FIRStorage.storage()

extension ImageContainingType {
    static var storage: FIRStorage { return FIRStorage.storage() }
    static var storageRef: FIRStorageReference { return storage.referenceForURL("gs://project-131193767834450985.appspot.com") }
}