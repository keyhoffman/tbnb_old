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
    
    init(sendingType: T)   { self = .CouldNotConvertSelfToFBDict(ErrorMessage(sendingType: sendingType).textValue) }
    init(FBError: NSError) { self = .FBThrownError(FBError) }
}

// MARK: - FirebaseObservingError

enum FBObservingError<T: FBSendable>: ErrorType {
    case CouldNotConvertSnapshotToFBDict(String)
    case CouldNotCreateNewInstance(String)
    case FBThrownError(NSError)
    
    init()                        { self = .CouldNotConvertSnapshotToFBDict("Could not convert snapshot to FBDictionary") }
    init(FBError: NSError)        { self = .FBThrownError(FBError) }
    init(failedCreationType f: String) { self = .CouldNotCreateNewInstance("Could not create a new instance of \(f)") }
    
    // MARK: - This is not working because Result wants an instance as opposed to a static type 
    
// FIXME: - Why this no working uhgggg
//    init(failedCreationType f: T, FBError: NSError) { self = .FBThrownError("-- \(f) --", FBError) }
// FIXME: - Why this no working uhgggg
//    init()                 { self = .CouldNotConvertSnapshotToFBDict(ErrorMessage().textValue) }
}

/// MARK: - AuthenticationError

enum AuthError: ErrorType {
    case InvalidTextInput(String)
    case FBThrownError(NSError)
    
    init(authenticationAction a: AuthenticationAction) { self = .InvalidTextInput("Invalid text input -- Please try to \(a.titleValue.lowercaseString) again") }
    init(FBError: NSError)                             { self = .FBThrownError(FBError) }
    
// FIXME: - Why this no working uhgggg
//    init(authenticationAction a: AuthenticationAction) { self = .InvalidTextInput(ErrorMessage(authenticationAction: a).textValue) }
}

//BananaKit//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////**data in, data out". This means that every time you pass a value in, you will always get the same value back out. THINK OF THE TESTS!*//////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////** Add ParameterObjects (structs) for initializers AndClosures*/////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////