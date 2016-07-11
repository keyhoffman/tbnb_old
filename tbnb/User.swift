//
//  User.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - User

struct User: FBSendable, FBObservable {
    let key:        String
    let username:   String
    let email:      String
    typealias Resource = User
}

// MARK: - User Static Properties Extension

extension User {
    static let Path         = "users/"
    static let NeedsAutoKey = false
    static let FBSubKeys    = ["username", "email"]
}

// MARK: - User "createNew" Initializer Extension
// FIXME: - Change FBDict keys from string literals

extension User {
    static func CreateNew(FBDict: FBDictionary?) -> Result<User, FBObservingError<User>> {
        print("User createNew FBDictionary? Dump")
        dump(FBDict)
        guard let FBDict = FBDict else { return Result(error: FBObservingError(failedCreationStaticType: User.self)) }
        guard let email = FBDict["email"] as? String, let username = FBDict["username"] as? String, let key = FBDict["key"] as? String else {
            return .Failure(FBObservingError(failedCreationStaticType: User.self))
        }
        return .Success(User(key: key, username: username, email: email))
    }
}

// MARK: - User Equatability 

func == (lhs: User, rhs: User) -> Bool {
    return lhs.key == rhs.key && lhs.username == rhs.username && lhs.email == rhs.email
}
