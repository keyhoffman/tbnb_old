//
//  FirebaseSendable.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - FirebaseSendable Protocol

protocol FBSendable: FBType, Equatable {
    var key: String { get }
    
    static var NeedsAutoKey: Bool           { get }
    static var FBSubKeys:   [String]       { get }
    
    static func CreateNew(FBDict: FBDictionary?) -> Result<Self, FBObservingError<Self>>
}

// MARK: - FirebaseSendable Protocol Extension

extension FBSendable {
    
    static func CreaeNew(FBDict: FBDictionary?) -> Result<Self, FBObservingError<Self>> {
        guard let FBDict = FBDict else { return Result(error: FBObservingError(failedCreationStaticType: Self.self)) }
        
    }

    
    func sendToFB(withResult: Result<Self, FBSendingError<Self>> -> Void) {
        guard let FBDict = convertToFBSendable() else {
            withResult(Result(error: FBSendingError(sendingType: self)))
            return
        }
        print("-- FBDictDump --")
        dump(FBDict)
        let path = Self.NeedsAutoKey ? Self.Path + autoKey : Self.Path + key
        print("path = \(path)")
        RootRef.child(path).setValue(FBDict) { error, _ in
            if let error = error {
                withResult(Result(error: FBSendingError(FBError: error)))
                return
            }
            withResult(Result(value: self))
        }
    }
    
    private var autoKey: String { return RootRef.childByAutoId().key }
    
    private func convertToFBSendable() -> FBDictionary? {
        var FBDict: FBDictionary = [:]
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            print("label = \(label), value = \(value)")
            FBDict[label] = value as? AnyObject
        }
        return Dictionary(FBDict.filter { Self.FBSubKeys.contains($0.0) })
    }
}

// MARK: - Dictionary Extension

extension Dictionary { // TODO: - Move elsewhere
    init(_ pairs: [Element]) {
        self.init()
        for (k, v) in pairs {
            self[k] = v
        }
    }
}
