//
//  User.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

/// MARK: - User

struct User: FBSendable {
    let key:        String
    let username:   String
    let email:      String
}

/// MARK: - User Extension

extension User {
    static let Path        = "users/"
    static let NeedsAutoID = false
    static let FBSubKeys   = ["username", "email"]
}

/// MARK: - User Equatability 

func == (lhs: User, rhs: User) -> Bool {
    return lhs.key == rhs.key && lhs.username == rhs.username && lhs.email == rhs.email
}