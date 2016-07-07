//
//  Meal.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

struct Meal {
    let key:            String /// each meal's key is equal to the key of the user that created it
    let name:           String
    let pricePerPerson: Double
    let feeds:          Int
    let sender:         User
}