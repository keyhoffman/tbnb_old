//
//  Resource.swift
//  tbnb
//
//  Created by Key Hoffman on 7/8/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

struct Resource<A: FBSendable>: FBObservable {
    let parse: FBDictionary? -> Result<A, FBObservingError>
    static var Path: String { return A.Path + "/" }
}

