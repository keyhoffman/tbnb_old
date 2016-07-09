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
        static let HeadingFontSize:      CGFloat = StyleSheet.DefaultHeadingFontSize
        static let PriceSubtitleSize:    CGFloat = 8.0
        static let HostImageBorderWidth: CGFloat = 2.0
        static let Height:               CGFloat = 320.0
    }
    
    static func prepare(cell: MealTableViewCell) {
        /// configure cell here!!!!
    }
}

/// MARK: - BackgroundColor

enum BackgroundColor {
    case White, Cyan, LightGray, Blue, Red
    
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
    case Opening, Login, SignUp
    
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
    case Login, SignUp
    
    var title: String {
        switch self {
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}

/// MARK: - AuthTextField

enum AuthTextField {
    case Email, Password, Username
    
    var textField: UITextField {
        let tf = UITextField()
        tf.defaultSettings()
        return tf
    }
    
    var placeholder: String {
        switch self {
        case .Email:    return "Enter your email"
        case .Password: return "Enter your password"
        case .Username: return "Enter your username"
        }
    }
    
    enum Frame {
        case WidthToViewWidthFactor, HeightToViewHeightFactor, TopToViewTopFactor
        
        var value: CGFloat {
            switch self {
            case .WidthToViewWidthFactor:   return 0.80
            case .HeightToViewHeightFactor: return 0.05
            case .TopToViewTopFactor:       return 0.20
            }
        }

    }
}

/// MARK: - TabBarNavigationController

enum TabBarNavigationController {
    case Meals, AddMeal, Profile
    
    var navigationController: UINavigationController { return UINavigationController() }
    
    var tabBarItemTitle: String {
        switch self {
        case .Meals:   return "Meals"
        case .AddMeal: return "Add Meal"
        case .Profile: return "Profile"
        }
    }
    
    var tabBarItemImage: UIImage? { return nil } /// TODO: - Add Images
    
    var tabBarItemTag: Int {
        switch self {
        case .Meals:   return 0
        case .AddMeal: return 1
        case .Profile: return 2
        }
    }
}

enum ErrorViewControllerAttributes {
    case View, Label, Text
    
    var title: String { return "Error!" }
    
    var color: UIColor {
        switch self {
        case .View:  return BackgroundColor.LightGray.color
        case .Label: return BackgroundColor.White.color
        case .Text:  return BackgroundColor.Red.color
        }
    }
    
    var labelWidthToViewWidthFactor: CGFloat { return 0.75 }
    
    var preferredContentSize: CGSize { return CGSize(width: 100, height: 100) }
}


/// MARK: - UITextField Extension

extension UITextField { /// TODO: - Move away from style sheet
    func clearText() {
        self.text = ""
    }
    
    func defaultSettings() {
        self.adjustsFontSizeToFitWidth = true
        self.autocapitalizationType    = .None
        self.autocorrectionType        = .No
        self.clearButtonMode           = .Always
        self.keyboardAppearance        = .Dark
        self.keyboardType              = .Default
    }
}





















