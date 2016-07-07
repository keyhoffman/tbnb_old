//
//  StyleSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - StyleSheet

struct StyleSheet {
    private init() {}
    
    static let DefaultHeadingFontSize:  CGFloat = 20
    static let DefaultSubtitleFontSize: CGFloat = 14
    
    struct MealCard {
        static let HeadingFontSize: CGFloat      = StyleSheet.DefaultHeadingFontSize
        static let PriceSubtitleSize: CGFloat    = 8.0
        static let HostImageBorderWidth: CGFloat = 2.0
        static let Height: CGFloat               = 320.0
    }
    
//    static func prepare(cell: MealTableViewCell) {
//        /// configure cell here!!!!
//    }
}

/// MARK: - BackgroundColor

enum BackgroundColor {
    case White
    case Cyan
    case LightGray
    case Blue
    case Red
    
    var color: UIColor {
        switch self {
        case .White:     return .whiteColor()
        case .Cyan:      return .cyanColor()
        case .LightGray: return .lightGrayColor()
        case .Blue:      return .blueColor()
        case .Red:       return .redColor()
        }
    }
}

/// MARK: - ViewControllerTitle

enum ViewControllerTitle {
    case Opening
    case Login
    case SignUp
    
    var title: String {
        switch self {
        case .Opening: return "Welcome to tbnb"
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}

/// MARK: - ButtonTitle

enum ButtonTitle {
    case Login
    case SignUp
    
    var title: String {
        switch self {
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}

/// MARK: - TextFieldFrame
/// TODO: FIX this!


//enum TextFieldFrame {
//    case Email
//    case Password
//    case Username
//    
//    init(view: UIView) {
//        self = .Email
//        self.view = view
//    }
//    
//    var view: UIView {
//        get { return self.view }
//        set { self.view = newValue }
//    }
//    
//    
//    
//    var frame: CGRect {
//        switch self {
//        case .Email: return CGRect(x: 0, y: 0, width: 0, height: 0)
//        case .Password: return CGRect(x: 0, y: 0, width: 0, height: 0)
//        case .Username: return CGRect(x: 0, y: 0, width: 0, height: 0)
//        }
//    }
//}




















