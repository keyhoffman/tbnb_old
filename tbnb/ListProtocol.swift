//
//  ListProtocol.swift
//  tbnb
//
//  Created by Key Hoffman on 7/7/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

/// MARK: - RemoteContentProviding Protocol

protocol RemoteContentProviding {
    associatedtype Content
    
    func fetchContent(completion: Result<Content, NSError> -> Void)
    func viewControllerForContent(content: Result<Content, NSError>) -> UIViewController
}

/// MARK: - Master ListType Protocol

protocol ListType {
    associatedtype ListView
    associatedtype Cell
    associatedtype Object
    
    func cellIdentifierForIndexPath(indexPath: NSIndexPath) -> String
    func listView(listView: ListView, configureCell cell: Cell, withObject object: Object, atIndexPath indexPath: NSIndexPath)
    func listView(listView: ListView, didSelectObject object: Object, atIndexPath indexPath: NSIndexPath)
}

/// MARK: - FetchedListType Protocol

protocol FetchedListType: ListType, RemoteContentProviding {
    var fetchedResultsController: UITableViewController { get } /// TODO: - Fix this
}

extension FetchedListType {
    var numberOfSections: Int { return 5 } /// TODO: - Fix this
    var sectionIndexTitles: [AnyObject]? { return nil } /// TODO: - Fix this
    
    func numberOfRowsInSections(section: Int) -> Int {
        return section /// TODO: - Fix this
    }
    
    func isValidIndexPath(indexPath: NSIndexPath) -> Bool { /// TODO: - Fix this
        return false
    }
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> AnyObject? { /// TODO: - Fix this
        return nil
    }
    
    func titleForHeaderInSection(section: Int) -> String? { /// TODO: - Fix this
        return nil
    }
}

/// MARK: - NonFetchedListType Protocol

protocol NonFetchedListType: ListType {
    var listData: [[Object]]! { get set }
}

extension NonFetchedListType {
    var numberOfSections: Int { return listData.count } /// TODO: - Fix this
    
    func numberOfRowsInSection(section: Int) -> Int { /// TODO: - Fix this
        return listData.count
    }
    
    func objectAtIndexPath(indexPath: NSIndexPath) -> Object { /// TODO: - Fix this
        return listData[[indexPath]]
    }
    
//    func isValidIndexPath(indexPath: NSIndexPath) -> Bool {
//        return
//    }
}

/// MARK: TableListType Protocol

protocol TableListType: NonFetchedListType, UITableViewDataSource, UITableViewDelegate  {
    var tableView: UITableView! { get set }
}

extension TableListType where ListView == UITableView, Cell == UITableViewCell {
    func tableCellAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = cellIdentifierForIndexPath(indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        
        if let object = objectAtIndexPath(indexPath) { /// TODO: - Fix this
            listView(tableView, configureCell: cell, withObject: object, atIndexPath: indexPath)
        }
        
        return cell
    }
    
    func tableDidSelectItemAtIndexPath(indexPath: NSIndexPath) {
        if let object = objectAtIndexPath(indexPath) { /// TODO: - Fix this
            listView(tableView, didSelectObject: object, atIndexPath: indexPath)
        }
    }
}













