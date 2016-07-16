//
//  Meal.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK - Meal

struct Meal: FBSendable, ImageContainingType {
    let key:            String /// each meal's key is equal to the key of the user that created it
    let name:           String
    let pricePerPerson: Double
    let feeds:          Int
//    let imagePath:      String
    let image:          UIImage
//    let chef:           User
//    let datePosted:     NSDate
}

// MARK: - Meal Static Properties Extension

extension Meal {
    static let Path         = "meals/"
    static let NeedsAutoKey = false
    static let FBSubKeys    = ["name", "pricePerPerson", "feeds"]
    static let Resource_    = Resource(parse: Meal.Create)
}

// MARK: - Meal "createNew" Initializer Extension
// FIXME: - Change FBDict keys from string literal to Meal.type

extension Meal {
    static func Create(FBDict: FBDictionary?) -> Result<Meal, FBObservingError<Meal>> {
        guard let FBDict = FBDict else { return Result(error: FBObservingError(ofType: Meal.self)) }
        guard let key = FBDict["key"] as? String, let name = FBDict["name"] as? String, let pricePerPerson = FBDict["pricePerPerson"] as? Double,
            let feeds = FBDict["feeds"] as? Int, let imagePath = FBDict["imagePath"] as? String else { return Result(error: FBObservingError(ofType: Meal.self)) }
        
        print("imagePath = \(imagePath)")
        let y = Meal.loadImage(withPath: imagePath) { imageResult in
            switch imageResult {
            case .Failure(_):     break
            case .Success(let i): break
            }
        }
    }
        
}

// MARK: - Meal Equatability

func ==(lhs: Meal, rhs: Meal) -> Bool {
    return lhs.key == rhs.key && lhs.name == rhs.name && lhs.pricePerPerson == rhs.pricePerPerson && lhs.feeds == rhs.feeds //&& lhs.chef == rhs.chef
}
