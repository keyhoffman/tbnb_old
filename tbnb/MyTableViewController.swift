//
//  MyTableViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/13/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

// MARK: - MyTableViewControllerDelegate Protocol

protocol MyTableViewControllerDelegate: class {
    associatedtype Item: FBSendable
    var configureSelf: MyTableViewController<Item> -> Void { get }
}

protocol LoadingDisplayType: class {
    associatedtype Resource: FBObservable
    var resource: Resource { get }
    var spinner: UIActivityIndicatorView { get }
}

extension UIActivityIndicatorView {
    convenience init(activityIndicatorStyle style: UIActivityIndicatorViewStyle, hidesWhenStops hides: Bool) {
        self.init()
        self.activityIndicatorViewStyle = style
        self.hidesWhenStopped = hides
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - MyTableViewController

class MyTableViewController<T: FBSendable>: UITableViewController, LoadingDisplayType {
    
//    weak var delegate: MyTableViewControllerDelegate?
    
    var configureSelf: MyTableViewController -> Void = { _ in }
    var configureCell: (UITableViewCell, T) -> Void = { _ in }
    var didSelect: T -> Void = { _ in }
    
    let resource: Resource<T>
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray, hidesWhenStops: true)
    
    private var items: [T] = []
    
    init(resource: Resource<T>) {
        self.resource = resource
        super.init(style: .Plain)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.center = view.center
        view.addSubview(spinner)
        
        configureSelf(self)
        load()
    }
    
    private func load() {
        spinner.startAnimating()
        resource.loadChildAdded { [weak self] result in
            switch result {
            case .Failure(let error): print(error)
            case .Success(let item):
                self?.spinner.stopAnimating()
                self?.items.append(item)
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        let item = items[indexPath.row]
        configureCell(cell, item)

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = items[indexPath.row]
        didSelect(item)
    }
 
}
