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
    associatedtype R: FBSendable
    var parse: FBDictionary? -> Result<R, FBObservingError<R>> { get }
}

// MARK: - FirebaseObservable Protocol Extension

extension FBObservable {
//    static var parse: FBDictionary? -> Result<R, FBObservingError<R>> { return R.Create }
    
    func loadChildAdded(withBlock: Result<R, FBObservingError<R>> -> Void) {
        observe(withPath: R.Path, withEventType: .ChildAdded) { withBlock($0) }
    }
    
    func loadValue(withKey key: String, withBlock: Result<R, FBObservingError<R>> -> Void) {
        let path = R.Path + key
        observe(withPath: path, withEventType: .Value) { withBlock($0) }
    }
    
    private func observe(withPath path: String, withEventType event: FIRDataEventType, withBlock: Result<R, FBObservingError<R>> -> Void) {
//        print("FBObservable Resource.Path = \(path)")
        RootRef.child(path).observeEventType(event, withBlock: { (snapshot: FIRDataSnapshot) in
//            print("snapshot.value = \(snapshot.value)")
            guard var FBDict = snapshot.value as? FBDictionary else { // TODO: Is it okay to make FBDict mutable?
                print("Resource loading fail")
                withBlock(Result(error: FBObservingError(ofSnapshotType: R.self)))
                return
            }
            FBDict["key"] = snapshot.key
//            print("-- FBObservable FBDict Dump --")
//            dump(FBDict)
            withBlock(self.parse(FBDict))
//            withBlock(R.Create(FBDict))
            return
        }) { error in
            withBlock(Result(error: FBObservingError(ofType: R.self, FBError: error)))
            return
        }

    }

    
}

//func +(lhs: FBDictionary, rhs: (key: String, value: String)) -> FBDictionary {
//    var dict = lhs
//    dict.updateValue(rhs.value, forKey: rhs.key)
//    return dict
//}
