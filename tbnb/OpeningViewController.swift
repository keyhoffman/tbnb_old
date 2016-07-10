//
//  OpeningViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/6/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import Foundation

// MARK: - OpeningViewControllerDelegate Protocol

protocol OpeningViewControllerDelegate: class {    
    func navigateToLoginButtonPressed(sender: OpeningViewController)
    func navigateToSignUpButtonPressed(sender: OpeningViewController)
}

// MARK: - OpeningViewController

final class OpeningViewController: UIViewController {
    
    // MARK: - OpeningViewControllerDelegate Declaration
    
    weak var delegate: OpeningViewControllerDelegate?
    
    // MARK: - UIBarButtonItem Declarations
    
    private let navigateToLoginButton  =  UIBarButtonItem()
    private let navigateToSignUpButton = UIBarButtonItem()
    
    // MARK: - OpeningViewController Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        title = ViewControllerTitle.Opening.title
        view.backgroundColor = BackgroundColor.LightGray.color
    }
    
    // MARK: - Navigation Action Methods
    
    func navigateToLoginViewController(sender: UIBarButtonItem) {
        delegate?.navigateToLoginButtonPressed(self)
    }
    
    func navigateToSignUpViewController(sender: UIBarButtonItem) {
        delegate?.navigateToSignUpButtonPressed(self)
    }
    
    // MARK: - Set View Properties
    
    private func setNavigationItems() {
        navigateToLoginButton.target = self
        navigateToLoginButton.action = #selector(OpeningViewController.navigateToLoginViewController(_:))
        navigateToLoginButton.title  = ButtonTitle.Login.title
        
        navigateToSignUpButton.target = self
        navigateToSignUpButton.action = #selector(OpeningViewController.navigateToSignUpViewController(_:))
        navigateToSignUpButton.title  = ButtonTitle.SignUp.title
        navigationItem.rightBarButtonItem = navigateToLoginButton
        navigationItem.leftBarButtonItem  = navigateToSignUpButton
    }
    
}



//loadImage { result in
//    switch result {
//    case .Failure(let error): print(error.localizedDescription)
//    case .Success(let lasagnaImage):
//        self.spinner.stopAnimating()
//        self.spinner.hidesWhenStopped = true
//        let imageView = UIImageView(image: lasagnaImage)
//        self.view.addSubview(imageView)
//        imageView.snp_makeConstraints { make in
//            make.center.equalTo(self.view.snp_center)
//            make.height.width.equalTo(StyleSheet.MealCard.Height)
//        }
//    }
//}

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
