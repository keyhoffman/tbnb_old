//
//  User.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - User

struct User: FBSendable {
    let key:        String
    let username:   String
    let email:      String
}

// MARK: - User Static Properties Extension

extension User {
    static let Path        = "users/"
    static let NeedsAutoID = false
    static let FBSubKeys   = ["username", "email"]
//    static let _Resource = Resource(parse: User.CreateNew)
}

// MARK: - User "createNew" Initializer Extension
// FIXME: - Change error handling from string literal to User.type
// TODO: - This is not working because Result wants an instance as opposed to a static type

extension User {
    static func CreateNew(FBDict: FBDictionary?) -> Result<User, FBObservingError<User>> {
        print("User createNew FBDictionary? Dump")
        dump(FBDict)
        guard let FBDict = FBDict else { return Result(error: FBObservingError(failedCreationType: "User")) }
        guard let email = FBDict["email"] as? String, let username = FBDict["username"] as? String, let key = FBDict["key"] as? String else {
            return Result(error: FBObservingError(failedCreationType: "User"))
        }
        return Result(value: User(key: key, username: username, email: email))
    }
}

// MARK: - User Equatability 

func == (lhs: User, rhs: User) -> Bool {
    return lhs.key == rhs.key && lhs.username == rhs.username && lhs.email == rhs.email
}

//    init?(FBDict: FBDictionary?) {
//        print("User FBDictionary? Dump")
//        dump(FBDict)
//        guard let FBDict = FBDict else { return nil }
//        guard let email = FBDict["email"] as? String, let username = FBDict["username"] as? String, let key = FBDict["key"] as? String else { return nil }
//        self.email    = email
//        self.username = username
//        self.key      = key
//    }
