//
//  FirebaseSendable.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import Firebase

// MARK: - FirebaseSendable Protocol

protocol FBSendable: FBType, Equatable {
    var key: String { get }
    
    static var NeedsAutoKey: Bool        { get }
    static var FBSubKeys:   [String]     { get }
    static var Resource_: Resource<Self> { get }
    
    static func Create(FBDict: FBDictionary?) -> Result<Self, FBObservingError<Self>> 
}

// MARK: - FirebaseSendable Protocol Extension

extension FBSendable {
    
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
            print("label = \(label), value dynamicType = \(value.dynamicType)")
            print("value subjectType = \(Mirror(reflecting: value).subjectType)")
            FBDict[label] = value as? AnyObject
        }
        return Dictionary(FBDict.filter { Self.FBSubKeys.contains($0.0) })
    }
}

extension FBSendable where Self: ImageContainingType {
    static func loadImage(withPath imagePath: String, withBlock: ImageResult<UIImage, NSError> -> Void) {
        let imageRef = storageRef.child(imagePath)
        
        imageRef.dataWithMaxSize(maxSize) { data, error in
            guard let data = data else { if let error = error { withBlock(.Failure(error)) }
                return
            }
            if let newImage = UIImage(data: data) {
                withBlock(.Success(newImage))
                return
            }
            return
        }
    }
    
}

protocol ImageContainingType: FBType {}

extension ImageContainingType {
    static var storage: FIRStorage { return FIRStorage.storage() }
    static var storageRef: FIRStorageReference { return storage.referenceForURL("gs://project-131193767834450985.appspot.com") }
    static var maxSize: Int64 { return 1 * 1024 * 1024 }
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
