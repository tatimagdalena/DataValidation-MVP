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
    
    var presenterUnderTest: RegistrationPresenter!
    var mockView: MockValidationView!
    
    override func setUp() {
        super.setUp()
        
        mockView = MockValidationView()
        presenterUnderTest = RegistrationPresenter(view: mockView,
                                                   nameValidator: NameValidator(),
                                                   emailValidator: EmailValidator(),
                                                   cpfValidator: CPFValidator())
        mockView.presenter = presenterUnderTest
    }
    
    override func tearDown() {
        mockView = nil
        presenterUnderTest = nil
        super.tearDown()
    }
    
}

// MARK: - Name tests -

extension RegistrationPresenterTests {
    
    func test_InvalidNameChange_CallHandlers() {
        // given
        let name = "Ab C"
        // when
        presenterUnderTest.userNameChanged(newName: name)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 1)
        XCTAssertEqual(mockView.emailHandlerCallCount, 0)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 0)
        XCTAssertEqual(mockView.readyToValidateCallCount, 1)
    }
    
    func test_InvalidNameChange_PassRightParameters() {
        // given
        let name = "Ab C"
        // when
        presenterUnderTest.userNameChanged(newName: name)
        // then
        XCTAssertEqual(mockView.fieldValidationParameter, Validation.invalid(displayMessage: "Entre com nome e sobrenome"))
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.invalid(displayMessage: nil))
    }
    
    func test_ValidNameChange_CallHandlers() {
        // given
        let name = "Fulano Silva"
        // when
        presenterUnderTest.userNameChanged(newName: name)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 1)
        XCTAssertEqual(mockView.emailHandlerCallCount, 0)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 0)
        XCTAssertEqual(mockView.readyToValidateCallCount, 1)
    }
    
    func test_ValidNameChange_PassRightParameters() {
        // given
        let name = "Fulano Silva"
        // when
        presenterUnderTest.userNameChanged(newName: name)
        // then
        XCTAssertEqual(mockView.fieldValidationParameter, Validation.valid)
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.invalid(displayMessage: nil))
    }
    
}

// MARK: - Email tests -

extension RegistrationPresenterTests {
    
    func test_InvalidEmailChange_CallHandlers() {
        // given
        let email = "mail.domain.com"
        //when
        presenterUnderTest.userEmailChanged(newEmail: email)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 0)
        XCTAssertEqual(mockView.emailHandlerCallCount, 1)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 0)
        XCTAssertEqual(mockView.readyToValidateCallCount, 1)
    }
    
    func test_InvalidEmailChange_PassRightParameters() {
        // given
        let email = "mail.domain.com"
        //when
        presenterUnderTest.userEmailChanged(newEmail: email)
        //then
        XCTAssertEqual(mockView.fieldValidationParameter, Validation.invalid(displayMessage: "Entre com um email válido"))
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.invalid(displayMessage: nil))
    }
    
    func test_ValidEmailChange_CallHandlers() {
        // given
        let email = "mail@domain.com"
        //when
        presenterUnderTest.userEmailChanged(newEmail: email)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 0)
        XCTAssertEqual(mockView.emailHandlerCallCount, 1)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 0)
        XCTAssertEqual(mockView.readyToValidateCallCount, 1)
    }
    
    func test_ValidEmailChange_PassRightParameters() {
        // given
        let email = "mail@domain.com"
        //when
        presenterUnderTest.userEmailChanged(newEmail: email)
        // then
        XCTAssertEqual(mockView.fieldValidationParameter, Validation.valid)
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.invalid(displayMessage: nil))
    }
    
}

// MARK: - CPF tests -

extension RegistrationPresenterTests {
    
    func test_InvalidCPFChange_CallHandlers() {
        // given
        let cpf = "75839274637"
        //when
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 0)
        XCTAssertEqual(mockView.emailHandlerCallCount, 0)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 1)
        XCTAssertEqual(mockView.readyToValidateCallCount, 1)
    }
    
    func test_InvalidCPFChange_PassRightParameters() {
        // given
        let cpf = "75839274637"
        //when
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        //then
        XCTAssertEqual(mockView.fieldValidationParameter, Validation.invalid(displayMessage: "Entre com um CPF válido"))
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.invalid(displayMessage: nil))
    }
    
    
    func test_ValidCPFChange_CallHandlers() {
        // given
        let cpf = "54644757969"
        //when
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 0)
        XCTAssertEqual(mockView.emailHandlerCallCount, 0)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 1)
        XCTAssertEqual(mockView.readyToValidateCallCount, 1)
    }
    
    func test_ValidCPFChange_PassRightParameters() {
        // given
        let cpf = "54644757969"
        //when
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        // then
        XCTAssertEqual(mockView.fieldValidationParameter, Validation.valid)
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.invalid(displayMessage: nil))
    }
    
}

// MARK: - Final validation tests -

extension RegistrationPresenterTests {
    
    func test_AllValidInputs_CallHandlers() {
        // given
        let name = "Fulano Silva"
        let cpf = "54644757969"
        let email = "mail@domain.com"
        //when
        presenterUnderTest.userNameChanged(newName: name)
        presenterUnderTest.userEmailChanged(newEmail: email)
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        //then
        XCTAssertEqual(mockView.nameHandlerCallCount, 1)
        XCTAssertEqual(mockView.emailHandlerCallCount, 1)
        XCTAssertEqual(mockView.cpfHandlerCallCount, 1)
        XCTAssertEqual(mockView.readyToValidateCallCount, 3)
        
    }
    
    func test_AllValidInputs_PassRightParameters() {
        // given
        let name = "Fulano Silva"
        let cpf = "54644757969"
        let email = "mail@domain.com"
        //when
        presenterUnderTest.userNameChanged(newName: name)
        presenterUnderTest.userEmailChanged(newEmail: email)
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        //then
        XCTAssertEqual(mockView.readyToValidateParameter, Validation.valid)
    }
    
}

// MARK: - Mock -

extension RegistrationPresenterTests {
    
    class MockValidationView: ValidationView {
        
        var cpfHandlerCallCount = 0
        var nameHandlerCallCount = 0
        var emailHandlerCallCount = 0
        var readyToValidateCallCount = 0
        var fieldValidationParameter: Validation?
        var readyToValidateParameter: Validation?
        var presenter: RegistrationPresenter?
        
        func onCPFValidation(_ validation: Validation) {
            fieldValidationParameter = validation
            cpfHandlerCallCount += 1
        }
        
        func onNameValidation(_ validation: Validation) {
            fieldValidationParameter = validation
            nameHandlerCallCount += 1
        }
        
        func onEmailValidation(_ validation: Validation) {
            fieldValidationParameter = validation
            emailHandlerCallCount += 1
        }
        
        func onReadyToValidate(_ validation: Validation) {
            readyToValidateParameter = validation
            readyToValidateCallCount += 1
        }
        
    }
    
}
