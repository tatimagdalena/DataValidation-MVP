//
//  RegistrationViewController.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 01/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import UIKit

// MARK: Outlets, actions & properties

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
    
    private var presenter: RegistrationPresenter?
    
}

// MARK: - Lifecycle -

extension RegistrationViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Criar Cadastro"
        
        // dismiss keyboard when touching outside
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

    }
}

// MARK: - View Protocol -

extension RegistrationViewController: ValidationView {
    
    func onCPFValidation(_ validation: Validation) {
        
    }
    
    func onNameValidation(_ validation: Validation) {
        
    }
    
    func onEmailValidation(_ validation: Validation) {
        
    }
    
    func onReadyToValidate(_ validation: Validation) {
        
    }
    
    
}

extension RegistrationViewController: UITextFieldDelegate {
    
}
