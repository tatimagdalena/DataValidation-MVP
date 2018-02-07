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
        clearScreenState()
        
        presenter = RegistrationPresenter(view: self, nameValidator: NameValidator(), emailValidator: EmailValidator(), cpfValidator: CPFValidator())
    }
    
    func viewInitialConfiguration() {
        title = "Criar Cadastro"
        // dismiss keyboard when touching outside
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
    }
    
    func clearScreenState() {
        nameTextField.text = ""
        emailTextField.text = ""
        cpfTextField.text = ""
        invalidNameLabel.text = ""
        invalidEmailLabel.text = ""
        invalidCPFLabel.text = ""
        confirmButton.isEnabled = false
    }
}

// MARK: - View Protocol -

extension RegistrationViewController: ValidationView {
    
    func onCPFValidation(_ validation: Validation) {
        cpfTextField.layer.borderColor = UIColor(hexString: validation.colorHex.rawValue).cgColor
        invalidCPFLabel.text = validation.message
    }
    
    func onNameValidation(_ validation: Validation) {
        nameTextField.layer.borderColor = UIColor(hexString: validation.colorHex.rawValue).cgColor
        invalidNameLabel.text = validation.message
    }
    
    func onEmailValidation(_ validation: Validation) {
        emailTextField.layer.borderColor = UIColor(hexString: validation.colorHex.rawValue).cgColor
        invalidEmailLabel.text = validation.message
    }
    
    func onReadyToValidate(_ validation: Validation) {
        confirmButton.isEnabled = validation.booleanValue
    }
    
}

// MARK: - Textfield -

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldsInitialConfiguration() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        cpfTextField.delegate = self
        
        nameTextField.addTarget(self, action: #selector(RegistrationViewController.textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(RegistrationViewController.textFieldDidChange(_:)), for: .editingChanged)
        cpfTextField.addTarget(self, action: #selector(RegistrationViewController.textFieldDidChange(_:)), for: .editingChanged)
        
        nameTextField.inputAccessoryView = toolbarView
        emailTextField.inputAccessoryView = toolbarView
        cpfTextField.inputAccessoryView = toolbarView
        
        nameTextField.layer.borderWidth = 0.5
        emailTextField.layer.borderWidth = 0.5
        cpfTextField.layer.borderWidth = 0.5
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let newText = textField.text else { return }
        
        if textField == nameTextField {
            presenter?.userNameChanged(newName: newText)
        } else if textField == emailTextField {
            presenter?.userEmailChanged(newEmail: newText)
        } else if textField == cpfTextField {
            presenter?.userCPFChanged(newDocument: newText)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == nameTextField {
            textField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        } else if textField == emailTextField {
            textField.resignFirstResponder()
            cpfTextField.becomeFirstResponder()
        } else if textField == cpfTextField {
            textField.resignFirstResponder()
        }
        return true
    }
    
}
