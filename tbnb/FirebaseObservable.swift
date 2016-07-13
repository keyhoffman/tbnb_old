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
    
    func loadChildAdded(withBlock: Result<Resource, FBObservingError<Resource>> -> Void) {
        observe(withPath: Resource.Path, withEventType: .ChildAdded) { withBlock($0) }
    }
    
    func loadValue(withKey key: String, withBlock: Result<Resource, FBObservingError<Resource>> -> Void) {
        let path = Resource.Path + key
        observe(withPath: path, withEventType: .Value) { withBlock($0) }
    }
    
    private func observe(withPath path: String, withEventType event: FIRDataEventType, withBlock: Result<Resource, FBObservingError<Resource>> -> Void) {
        print("FBObservable Resource.Path = \(path)")
        RootRef.child(path).observeEventType(event, withBlock: { (snapshot: FIRDataSnapshot) in
            print("snapshot.value = \(snapshot.value)")
            guard var FBDict = snapshot.value as? FBDictionary else { // TODO: Is it okay to make FBDict mutable?
                print("Resource loading fail")
                withBlock(Result(error: FBObservingError(ofSnapshotType: Resource.self)))
                return
            }
            FBDict["key"] = snapshot.key
            print("-- FBObservable FBDict Dump --")
            dump(FBDict)
            withBlock(Self.parse(FBDict))
            return
        }) { error in
            withBlock(Result(error: FBObservingError(ofType: Resource.self, FBError: error)))
            return
        }

    }

    
}

//func +(lhs: FBDictionary, rhs: (key: String, value: String)) -> FBDictionary {
//    var dict = lhs
//    dict.updateValue(rhs.value, forKey: rhs.key)
//    return dict
//}
