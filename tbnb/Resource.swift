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

//struct Resource<A: FBSendable>: FBObservable {
//    let parse: FBDictionary? -> Result<A, FBObservingError<A>>
//    static var Path: String { return A.Path + "/" }
//}


// MARK: - FirebaseSendable Protocol Static Extension

//extension FBSendable {
    //    static var _Resource: Resource<Self> { return Resource(parse: Self.CreateNew) }
    
    //    static func CreateNew(FBDict: FBDictionary?) -> Result<Self, FBObservingError<Self>> {
    //        return Result(value: Self) // TODO: - This is not working because Result wants an instance as opposed to a static type
    //    }
//}