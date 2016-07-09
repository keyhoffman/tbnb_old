//
//  ErrorTypes.swift
//  tbnb
//
//  Created by Key Hoffman on 7/9/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

/// MARK: - ErrorSendingType Protocol

protocol ErrorSendingType {
    func anErrorHasOccurred(error: ErrorType, sender: Coordinator)
}

/// MARK: - FirebaseSendingError

enum FBSendingError<T: FBSendable>: ErrorType {
    case CouldNotConvertSelfToFBDict(String)
    case FBThrownError(NSError)
    
    init(sendingType: T)   { self = .CouldNotConvertSelfToFBDict("Could not convert \(sendingType) to FBDictionary") }
    init(FBError: NSError) { self = .FBThrownError(FBError) }
}

/// MARK: - FirebaseObservingError

enum FBObservingError: ErrorType {
    case CouldNotConvertSnapshotToFBDict(String)
    case FBThrownError(NSError)
    
    init()                 { self = .CouldNotConvertSnapshotToFBDict("Could not convert snapshot to FBDictionary") }
    init(FBError: NSError) { self = .FBThrownError(FBError) }
}
