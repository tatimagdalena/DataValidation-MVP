//
//  RegistrationPresenter.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

class RegistrationPresenter {
    
    private unowned var view: ValidationView
    private let nameValidator: NameValidator
    private let emailValidator: EmailValidator
    private let cpfValidator: CPFValidator
    
    private var isNameValid = false
    private var isEmailValid = false
    private var isCPFValid = false
    
    init(view: ValidationView, nameValidator: NameValidator, emailValidator: EmailValidator, cpfValidator: CPFValidator) {
        self.view = view
        self.nameValidator = nameValidator
        self.emailValidator = emailValidator
        self.cpfValidator = cpfValidator
    }
    
    func userNameChanged(newName: String) {
        isNameValid = nameValidator.validate(name: newName)
        if !isNameValid {
            view.onNameValidation(.invalid(displayMessage: "Entre com nome e sobrenome"))
        } else {
            view.onNameValidation(.valid)
        }
        handleAllFieldsValidation()
    }
    
    func userCPFChanged(newDocument: String) {
        isCPFValid = cpfValidator.validate(document: newDocument)
        if !isCPFValid {
            view.onCPFValidation(.invalid(displayMessage: "Entre com um CPF válido"))
        } else {
            view.onCPFValidation(.valid)
        }
        
        handleAllFieldsValidation()
    }
    
    func userEmailChanged(newEmail: String) {
        isEmailValid = emailValidator.validate(email: newEmail)
        if !isEmailValid {
            view.onEmailValidation(.invalid(displayMessage: "Entre com um email válido"))
        } else {
            view.onEmailValidation(.valid)
        }
        handleAllFieldsValidation()
    }
    
    func performValidation() {
        handleAllFieldsValidation()
    }
    
    private func handleAllFieldsValidation() {
        if isNameValid && isEmailValid && isCPFValid {
            view.onReadyToValidate(.valid)
        } else {
            view.onReadyToValidate(.invalid(displayMessage: nil))
        }
    }
    
}
