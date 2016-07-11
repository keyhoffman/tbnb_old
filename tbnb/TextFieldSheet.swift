//
//  TextFieldSheet.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AuthTextField

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

// MARK: - UITextField Extension

extension UITextField { // TODO: - Move away from style sheet
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
