//
//  FirebaseTypes.swift
//  tbnb
//
//  Created by Key Hoffman on 7/7/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

/// MARK: - FBDictionary

typealias FBDictionary = [String : AnyObject]

/// MARK: - FirebaseType Protocol

protocol FirebaseType {
    static var Path: String { get }
}

extension FirebaseType { var RootRef: FIRDatabaseReference { return FIRDatabase.database().reference() } }

/// MARK: - FirebaseSendable Protocol

enum FBType {
    case User, Meal
}

protocol FirebaseSendable: FirebaseType, Equatable {
    var key: String { get }
    var fbType: FBType { get }
    
    static var NeedsAutoID: Bool     { get }
    static var Path:        String   { get }
    static var FBSubKeys:   [String] { get }
}

extension FirebaseSendable {
    func sendToFB() {
        guard let FBDict = convertToFBSendable() else { return }
        print("-- FBDump --")
        dump(FBDict)
        if Self.NeedsAutoID { self.RootRef.child(Self.Path).childByAutoId().setValue(FBDict) }
        else {
            let path = Self.Path + key
            print("path = \(path)")
            self.RootRef.child(path).setValue(FBDict)
        }
    }
    
    private func convertToFBSendable() -> FBDictionary? {
        var FBDict: FBDictionary = [:]
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            print("label = \(label), value = \(value)")
            FBDict[label] = value as? AnyObject
        }
        switch fbType {
        case .User:
            return Dictionary(FBDict.filter { $0.0 == "name" || $0.0 == "email" })
        case .Meal: return ["A" : 4]
        }
    }
}

/// MARK: - Dictionary Extension
/// TODO: - Move elsewhere

extension Dictionary {
    init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
}
