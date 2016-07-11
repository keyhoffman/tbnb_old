//
//  ButtonSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - ButtonTitle

enum ButtonTitle {
    case Login, SignUp
    
    var title: String {
        switch self {
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}
