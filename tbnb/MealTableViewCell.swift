//
//  MealTableViewCell.swift
//  tbnb
//
//  Created by Key Hoffman on 7/8/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

// MARK: - MealTableViewCell

class MealTableViewCell: UITableViewCell {

    struct ViewData {
        let name:           String
        let pricePerPerson: Double
        let feeds:          Int
//        let chef:           User
//        let image:          UIImage
//        let datePosted:     NSDate
    }
    
    var viewData: ViewData? {
        didSet {
            textLabel?.text       = viewData?.name
            detailTextLabel?.text = String(viewData?.pricePerPerson)
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// MARK: - MealTableViewCell Extension

extension MealTableViewCell.ViewData {
    init(meal: Meal) {
        self.name           = meal.name
        self.pricePerPerson = meal.pricePerPerson
        self.feeds          = meal.feeds
//        self.chef           = meal.chef
//        self.image          = meal.image! // fix this
//        self.datePosted     = meal.datePosted
    }
}
