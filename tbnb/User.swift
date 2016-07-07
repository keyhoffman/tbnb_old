//
//  User.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

struct User: FirebaseSendable {
    let key:    String
    let name:   String
    let email:  String
    
    let fbType: FBType = .User
}

extension User {
    static let Path        = "users/"
    static let NeedsAutoID = false
    static let FBSubKeys   = ["name", "email"]
}

func == (lhs: User, rhs: User) -> Bool {
    return lhs.key == rhs.key && lhs.name == rhs.name && lhs.email == rhs.email
}