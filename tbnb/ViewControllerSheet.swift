//
//  ViewControllerSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ViewControllerTitle

enum ViewController {
    case Opening, Login, SignUp
    
    var title: String {
        switch self {
        case .Opening: return "tbnb"
        case .Login:   return "Login"
        case .SignUp:  return "Sign Up"
        }
    }
}

// MARK: - ErrorViewControllerAttribute

enum ErrorViewControllerAttribute {
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
