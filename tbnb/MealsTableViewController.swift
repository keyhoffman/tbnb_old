//
//  MealsTableViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/15/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    
    private let incomingDataManager = IncomingDataManager()
    private var incomingDataManagerTableViewAdaptor: IncomingDataManagerTableViewAdaptor<MealTableViewCell>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        incomingDataManagerTableViewAdaptor = IncomingDataManagerTableViewAdaptor(tableView: tableView)
        
        incomingDataManager.delegate = incomingDataManagerTableViewAdaptor
        tableView.dataSource = incomingDataManagerTableViewAdaptor
    }
}
