//
//  ErrorViewController.swift
//  tbnb
//
//  Created by Key Hoffman on 7/8/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit
import SnapKit

/// MARK: - ErrorViewControllerDelegate Protocol

protocol ErrorViewControllerDelegate: class {
    func userHasAcknowledgedError(sender: ErrorViewController)
}

/// MARK: - ErrorViewController

class ErrorViewController: UIViewController {
    
    /// MARK: - ErrorViewControllerDelegate Declaration
    
    weak var delegate: ErrorViewControllerDelegate?
    
    let errorMessage: String
    
    /// MARK: UILabel Declarations
    
    let errorLabel = UILabel()
    
    /// MARK: UIButton Declarations
    
    let errorButton = UIButton()
    
    /// MARK: - ErrorViewController Initializer
    
    init(errorMessage: String) {
        self.errorMessage = errorMessage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// MARK: - ErrorViewController Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = ErrorViewControllerAttributes.View.title
        
        view.backgroundColor = ErrorViewControllerAttributes.View.color
        setErrorLabelProperties()
    }
    
    /// MARK: - Set View Properties
    
    private func setErrorLabelProperties() {
        view.addSubview(errorLabel)
        errorLabel.text            = errorMessage
        errorLabel.backgroundColor = ErrorViewControllerAttributes.Label.color
        errorLabel.textColor       = ErrorViewControllerAttributes.Text.color
        
        errorLabel.snp_makeConstraints { make in
            make.center.equalTo(self.view.snp_center)
            make.height.width.equalTo(self.view.snp_width).multipliedBy(ErrorViewControllerAttributes.Label.labelWidthToViewWidthFactor)
        }
    }
    
    private func setErrorButtonProperties() {
        view.addSubview(errorButton)
        errorButton.setTitle("Press this, idiot", forState: .Normal)
        errorButton.backgroundColor = BackgroundColor.White.color
        errorButton.tintColor       = BackgroundColor.Red.color
        errorButton.addTarget(self, action: #selector(ErrorViewController.errorButtonPressed(_:)), forControlEvents: .TouchUpInside)
        
        errorButton.snp_makeConstraints { make in
            make.centerX.equalTo(self.view.snp_centerX)
            make.bottom.equalTo(errorLabel.snp_top).offset(20)
            make.width.equalTo(errorLabel.snp_width)
            make.height.equalTo(errorLabel.snp_height).multipliedBy(0.50)
        }
    }

    /// MARK: UIButton Action Methods
    
    func errorButtonPressed(sender: UIButton) {
        self.delegate?.userHasAcknowledgedError(self)
    }
    
}













