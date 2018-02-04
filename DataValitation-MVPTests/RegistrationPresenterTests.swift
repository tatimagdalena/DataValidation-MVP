//
//  RegistrationPresenterTests.swift
//  DataValitation-MVPTests
//
//  Created by Tatiana Magdalena on 03/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
@testable import DataValitation_MVP

class RegistrationPresenterTests: XCTestCase {
    
    class MockValidationView: ValidationView {
        
        var invalidCPFCallCount = 0
        var invalidNameCallCount = 0
        var invalidEmailCallCount = 0
        var readyToValidateCallCount = 0
        
        func onCPFInvalid() {
            invalidCPFCallCount += 1
        }
        
        func onNameInvalid() {
            invalidNameCallCount += 1
        }
        
        func onEmailInvalid() {
            invalidEmailCallCount += 1
        }
        
        func onReadyToValidate() {
            readyToValidateCallCount += 1
        }
    }
    
    var presenterUnderTest: RegistrationPresenter!
    
    override func setUp() {
        super.setUp()
        presenterUnderTest = RegistrationPresenter(view: MockValidationView(),
                                                   nameValidator: NameValidator(),
                                                   emailValidator: EmailValidator(),
                                                   cpfValidator: CPFValidator())
    }
    
    override func tearDown() {
        presenterUnderTest = nil
        super.tearDown()
    }
    
}
