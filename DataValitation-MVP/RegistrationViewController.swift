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

    // toolbar
    @IBOutlet var toolbarView: UIView!
    @IBAction func closeKeyboard(_ sender: UIButton) {
        view.endEditing(true)
    }
    // textfields
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var cpfTextField: UITextField!
    // labels
    @IBOutlet var invalidNameLabel: UILabel!
    @IBOutlet var invalidEmailLabel: UILabel!
    @IBOutlet var invalidCPFLabel: UILabel!
    // button
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
        
        viewInitialConfiguration()
        textFieldsInitialConfiguration()
        
        presenter = RegistrationPresenter(view: self, nameValidator: NameValidator(), emailValidator: EmailValidator(), cpfValidator: CPFValidator())
    }
    
    func viewInitialConfiguration() {
        title = "Criar Cadastro"
        // dismiss keyboard when touching outside
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
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

// MARK: - Textfield -

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldsInitialConfiguration() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        cpfTextField.delegate = self
        
        nameTextField.inputAccessoryView = toolbarView
        emailTextField.inputAccessoryView = toolbarView
        cpfTextField.inputAccessoryView = toolbarView
        
        nameTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderWidth = 0.5
        cpfTextField.layer.borderWidth = 0.5
    }
    
}
