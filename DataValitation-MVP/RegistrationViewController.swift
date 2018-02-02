//
//  RegistrationViewController.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 01/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

// MARK: Outlets

class RegistrationViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var cpfTextField: UITextField!
    @IBOutlet var confirmButton: UIButton!
    
    @IBAction func confirm(_ sender: UIButton) {
        print(nameTextField.text ?? "")
        print(emailTextField.text ?? "")
        print(cpfTextField.text ?? "")
    }
    
}

// MARK: - Lifecycle -

extension RegistrationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // dismiss keyboard when touching outside
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
}
