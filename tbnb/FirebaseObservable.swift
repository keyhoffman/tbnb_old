//
//  FirebaseObservable.swift
//  tbnb
//
//  Created by Key Hoffman on 7/8/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

// MARK: - FirebaseObservable Protocol Extension

protocol FBObservable: FBType {
    associatedtype Resource: FBSendable
    static var parse: FBDictionary? -> Result<Resource, FBObservingError<Resource>> { get }
}

// MARK: - FirebaseObservable Protocol Extension

extension FBObservable {
    static var parse: FBDictionary? -> Result<Resource, FBObservingError<Resource>> { return Resource.CreateNew }
    
    func load(withBlock: Result<Resource, FBObservingError<Resource>> -> Void) {
        RootRef.child(Resource.Path).observeEventType(.ChildAdded, withBlock: { (snapshot: FIRDataSnapshot) in
            guard var FBDict = snapshot.value as? FBDictionary else {
                withBlock(Result(error: FBObservingError(snapshotStaticType: Resource.self)))
                return
            }
            FBDict["key"] = snapshot.key
            withBlock(Self.parse(FBDict))
            return
            }) { error in
                withBlock(Result(error: FBObservingError(snapshotStaticType: Resource.self, FBError: error)))
                return
        }
    }
}