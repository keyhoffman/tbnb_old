//
//  Result.swift
//  tbnb
//
//  Created by Key Hoffman on 7/10/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - ResultType Protocol

protocol ResultType {
    associatedtype Value: FBSendable
    associatedtype Error: ErrorType
    
    init(value: Value)
    init(error: Error)
    
    var value: Value?     { get }
    var error: ErrorType? { get }
}

// MARK - Result

enum Result<T: FBSendable, Error: ErrorType>: ResultType {
    typealias Value = T
    
    case Success(Value)
    case Failure(Error)
    
    init(value: Value) { self = .Success(value) }
    init(error: Error) { self = .Failure(error) }
    
    var value: Result.Value? { return self.value }
    var error: ErrorType?    { return self.error }
    
}
