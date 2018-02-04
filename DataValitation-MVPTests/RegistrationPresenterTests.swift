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
        
        static var invalidCPFCallCount = 0
        static var invalidNameCallCount = 0
        static var invalidEmailCallCount = 0
        static var readyToValidateCallCount = 0
        
        var presenter: RegistrationPresenter?
        
        func onCPFInvalid() {
            MockValidationView.invalidCPFCallCount += 1
        }
        
        func onNameInvalid() {
            MockValidationView.invalidNameCallCount += 1
        }
        
        func onEmailInvalid() {
            MockValidationView.invalidEmailCallCount += 1
        }
        
        func onReadyToValidate() {
            MockValidationView.readyToValidateCallCount += 1
        }
    }
    
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
    
    func testInvalidNameChange() {
        
        // given
        let name = "Ab C"
        
        //when
        presenterUnderTest.userNameChanged(newName: name)
        
        //then
        XCTAssertEqual(MockValidationView.invalidNameCallCount, 1)
        
    }
    
    func testInvalidEmailChange() {
        
        // given
        let email = "mail.domain.com"
        
        //when
        presenterUnderTest.userEmailChanged(newEmail: email)
        
        //then
        XCTAssertEqual(MockValidationView.invalidEmailCallCount, 1)
        
    }
    
    func testInvalidCPFChange() {
        
        // given
        let cpf = "75839274637"
        
        //when
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        
        //then
        XCTAssertEqual(MockValidationView.invalidCPFCallCount, 1)
        
    }
    
    func testAllInputsAreValid() {
        
        // given
        let name = "Fulano Silva"
        let cpf = "54644757969"
        let email = "mail@domain.com"
        
        //when
        presenterUnderTest.userNameChanged(newName: name)
        presenterUnderTest.userEmailChanged(newEmail: email)
        presenterUnderTest.userCPFChanged(newDocument: cpf)
        
        //then
        XCTAssertEqual(MockValidationView.readyToValidateCallCount, 1)
        
    }
    
}
