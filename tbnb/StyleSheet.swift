//
//  StyleSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/3/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - StyleSheet

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
        // configure cell here!!!!
    }
}

// MARK: - BackgroundColor

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

// MARK: - TabBarNavigationController

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
    
    var tabBarItemImage: UIImage? { return nil } // TODO: - Add Images
    
    var tabBarItemTag: Int {
        switch self {
        case .Meals:   return 0
        case .AddMeal: return 1
        case .Profile: return 2
        }
    }
}





















