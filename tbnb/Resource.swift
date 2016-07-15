//
//  Resource.swift
//  tbnb
//
//  Created by Key Hoffman on 7/8/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

// MARK: - Resource

struct Resource<R: FBSendable>: FBObservable {
    static var Path: String { return R.Path + "/" }
    let parse: FBDictionary? -> Result<R, FBObservingError<R>>
}


// MARK: - FirebaseSendable Protocol Static Extension

//extension FBSendable {
    //    static var _Resource: Resource<Self> { return Resource(parse: Self.CreateNew) }
    
    //    static func CreateNew(FBDict: FBDictionary?) -> Result<Self, FBObservingError<Self>> {
    //        return Result(value: Self) // TODO: - This is not working because Result wants an instance as opposed to a static type
    //    }
//}

//    static func CreaeNewME(FBDict: FBDictionary?) -> Result<Self, FBObservingError<Self>> {
//        guard let FBDict = FBDict else { return Result(error: FBObservingError(ofType: Self.self)) }
//        let mirror = Mirror(reflecting: Self.self)
//        for case let (label?, value) in mirror.children {
//            guard case let Self.self.label? = FBDict["\(label)"] as? value.dynamicType else { return Result(error: FBObservingError(ofType: Self.self)) }
//        }
//    }