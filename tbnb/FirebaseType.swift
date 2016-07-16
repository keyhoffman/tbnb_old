//
//  FirebaseTypes.swift
//  tbnb
//
//  Created by Key Hoffman on 7/7/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

// MARK: - FBDictionary

typealias FBDictionary = [String : AnyObject]

// MARK: - FirebaseType Protocol

protocol FBType {
    static var Path: String { get }
}

// MARK: - FirebaseType Protocol Extension
// TODO: - Should RootRef be Static????

extension FBType { var RootRef: FIRDatabaseReference { return FIRDatabase.database().reference() } }



//    func loadImage(withBlock: Result<UIImage, NSError> -> Void) {
//
//        let maxSize: Int64 = 1 * 1024 * 1024
//
//        let storage = FIRStorage.storage()
//        let storageRef = storage.referenceForURL("gs://project-131193767834450985.appspot.com")
//
//        let lasagnaRef = storageRef.child("Meal1_Lasagna/Lasagna1.jpg")
//
//        lasagnaRef.dataWithMaxSize(maxSize) { data, error in
//            guard let data = data else { if let error = error { withBlock(Result(error: error)) }
//                print("EEEEEERRRPR")
//                return
//            }
//
//            if let lasagnaImage = UIImage(data: data) {
//                print("-- lasagnaImageDump --")
//                dump(lasagnaImage)
//                withBlock(Result(value: lasagnaImage))
//                print("Nah brah")
//                return
//            }
//            return
//        }
//
//    }
//
