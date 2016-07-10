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

struct Meal: FBSendable {
    let key:            String /// each meal's key is equal to the key of the user that created it
    let name:           String
    let pricePerPerson: Double
    let feeds:          Int
//    let chef:           User
//    let image:          UIImage?
//    let datePosted:     NSDate
}

// MARK: - Meal Static Properties Extension

extension Meal {
    static let Path        = "meals/"
    static let NeedsAutoID = false
    static let FBSubKeys   = ["name", "pricePerPerson", "feeds"]
//    static let _Resource   = Resource(parse: Meal.CreateNew)
}

// MARK: - Meal "createNew" Initializer Extension
// FIXME: - Change error handling from string literal to Meal.type
// TODO: - This is not working because Result wants an instance as opposed to a static type

extension Meal {
    static func CreateNew(FBDict: FBDictionary?) -> Result<Meal, FBObservingError<Meal>> {
        print("Meal createNew FBDictionary? Dump")
        dump(FBDict)
        guard let FBDict = FBDict else { return Result(error: FBObservingError(failedCreationType: "Meal")) }
        guard let key = FBDict["key"] as? String, let name = FBDict["name"] as? String, let pricePerPerson = FBDict["pricePerPerson"] as? Double,
            let feeds = FBDict["feeds"] as? Int else { return Result(error: FBObservingError(failedCreationType: "Meal")) }
        return Result(value: Meal(key: key, name: name, pricePerPerson: pricePerPerson, feeds: feeds))
    }
}

// MARK: - Meal Equatability

func ==(lhs: Meal, rhs: Meal) -> Bool {
    return lhs.key == rhs.key && lhs.name == rhs.name && lhs.pricePerPerson == rhs.pricePerPerson && lhs.feeds == rhs.feeds //&& lhs.chef == rhs.chef
}


//    init?(FBDict: FBDictionary?) {
//        print("Meal FBDictionary? Dump")
//        dump(FBDict)
//        guard let FBDict = FBDict else { return nil }
//        guard let key = FBDict["key"] as? String, let name = FBDict["name"] as? String, let pricePerPerson = FBDict["pricePerPerson"] as? Double,
//            let feeds = FBDict["feeds"] as? Int else { return nil }
//        self.key = key
//        self.name = name
//        self.pricePerPerson = pricePerPerson
//        self.feeds = feeds
//    }
