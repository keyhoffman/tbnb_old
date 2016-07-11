//
//  ErrorSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ErrorMessage

enum ErrorMessage<T: FBSendable> {
    case FBSendingError(T)
    case AuthError(AuthenticationAction)
    case FBObservingError(T.Type)
    
    var textValue: String {
        switch self {
        case .AuthError(let action):               return "Invalid text input -- Please try to \(action.titleValue.lowercaseString) again"
        case .FBSendingError(let sendingType):     return "Could not convert \(sendingType) to FBDictionary"
        case .FBObservingError(let observingType):  return "Could not convert \(observingType) snapshot to FBDictionary"
        }
    }
}
