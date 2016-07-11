//
//  ErrorTypes.swift
//  tbnb
//
//  Created by Key Hoffman on 7/9/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// TODO: - Move string literals to StyleSheet
// MARK: - ErrorSendingType Protocol

protocol ErrorSendingType {
    func anErrorHasOccurred(error: ErrorType, sender: Coordinator)
}

// MARK: - FirebaseSendingError

enum FBSendingError<T: FBSendable>: ErrorType {
    case CouldNotConvertSelfToFBDict(String)
    case FBThrownError(NSError)
    
    init(sendingType: T)   { self = .CouldNotConvertSelfToFBDict(ErrorMessage.FBSendingError(sendingType).textValue) }
    init(FBError: NSError) { self = .FBThrownError(FBError) }
}

// MARK: - FirebaseObservingError

enum FBObservingError<T: FBSendable>: ErrorType {
    case CouldNotConvertSnapshotToFBDict(String)
    case CouldNotCreateNewInstance(String)
    case FBThrownError(String)
    
    init(ofSnapshotType type: T.Type)           { self = .CouldNotConvertSnapshotToFBDict(ErrorMessage.FBObservingError(type).textValue) }
    init(ofType type: T.Type, FBError: NSError) { self = .FBThrownError("-- \(type) --\n" + FBError.localizedDescription) }
    init(ofType type: T.Type)                   { self = .CouldNotCreateNewInstance("Could not create a new instance of \(type)") }
}

/// MARK: - AuthenticationError

enum AuthError: ErrorType {
    case InvalidTextInput(String)
    case FBThrownError(NSError)
    
    init(authenticationAction a: AuthenticationAction) { self = .InvalidTextInput("Invalid text input -- Please try to \(a.titleValue.lowercaseString) again") }
    init(FBError: NSError)                             { self = .FBThrownError(FBError) }
    
// FIXME: - Why this no working uhgggg
//    init(authenticationAction a: AuthenticationAction) { self = .InvalidTextInput(ErrorMessage.AuthError(a).textValue) }
}
