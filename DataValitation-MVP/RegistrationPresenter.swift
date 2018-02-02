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
    let nameValidator: NameValidator
    let emailValidator: EmailValidator
    let cpfValidator: CPFValidator
    
    init(view: ValidationView, nameValidator: NameValidator, emailValidator: EmailValidator, cpfValidator: CPFValidator) {
        self.view = view
        self.nameValidator = nameValidator
        self.emailValidator = emailValidator
        self.cpfValidator = cpfValidator
    }
    
    func userNameChanged(newText: String) {
        
    }
    
    func userCPFChanged(newText: String) {
        
    }
    
    func userEmailChanged(newText: String) {
        
    }
    
    func performValidation() {
        
    }
    
}
