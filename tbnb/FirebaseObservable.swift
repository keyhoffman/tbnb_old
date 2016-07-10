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
    associatedtype A: FBSendable
    var parse: FBDictionary? -> Result<A, FBObservingError<A>> { get }
}

// MARK: - FirebaseObservable Protocol Extension

extension FBObservable {
    func load(withBlock: Result<A, FBObservingError<A>> -> Void) {
        RootRef.child(A.Path).observeEventType(.ChildAdded, withBlock: { (snapshot: FIRDataSnapshot) in
            guard var FBDict = snapshot.value as? FBDictionary else {
                withBlock(Result(error: FBObservingError()))
                return
            }
            FBDict["key"] = snapshot.key
            withBlock(self.parse(FBDict))
            return
            }) { error in
                withBlock(Result(error: FBObservingError(FBError: error)))
//                withBlock(Result(error: FBObservingError(failedCreationType: A, FBError: error)))
                return
        }
    }
}