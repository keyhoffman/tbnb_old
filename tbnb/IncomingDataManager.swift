//
//  IncomingDataManager.swift
//  tbnb
//
//  Created by Key Hoffman on 7/15/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol IncomingDataManagerDelegate: class {}

class IncomingDataManager {
    
    weak var delegate: IncomingDataManagerDelegate?
    
}

class IncomingDataManagerTableViewAdaptor<CellType: UITableViewCell>: NSObject, UITableViewDataSource, IncomingDataManagerDelegate {
    
    private let tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath) as! CellType
        return cell
    }
}