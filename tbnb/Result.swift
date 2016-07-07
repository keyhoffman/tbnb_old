//
//  Result.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol ResultType {
    associatedtype Value
    associatedtype Error: ErrorType
    
    init(value: Value)
    init(error: Error)
    
    var value: Value?     { get }
    var error: ErrorType? { get }
}


enum Result<T, Error: ErrorType>: ResultType {
    typealias Value = T
    
    case Success(Value)
    case Failure(Error)
    
    init(value: Value) { self = .Success(value) }
    init(error: Error) { self = .Failure(error) }
    
    var value: Result.Value? { return self.value }
    var error: ErrorType?    { return self.error }
    
}

protocol RemoteContentProviding {
    associatedtype Content
    
    func fetchContent(completion: Result<Content, NSError> -> Void)
    func viewControllerForContent(content: Result<Content, NSError>) -> UIViewController
}