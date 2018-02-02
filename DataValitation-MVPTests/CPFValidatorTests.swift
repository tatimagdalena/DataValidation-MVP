//
//  CPFValidatorTests.swift
//  DataValitation-MVPTests
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
@testable import DataValitation_MVP

class CPFValidatorTests: XCTestCase {
    
    var validatorUnderTest: CPFValidator!
    
    override func setUp() {
        super.setUp()
        validatorUnderTest = CPFValidator()
    }
    
    override func tearDown() {
        validatorUnderTest = nil
        super.tearDown()
    }
    
    func testEmptyStringIsInvalid() {
        
        // given
        let cpf = ""
        
        //when
        let validationResponse = validatorUnderTest.validate(document: cpf)
        
        //then
        XCTAssertFalse(validationResponse, "An empty string is valid when it shouldn't be.")
        
    }
    
    func testFewerDigitsIsInvalid() {
        
        // given
        let cpf = "5464475796"
        
        //when
        let validationResponse = validatorUnderTest.validate(document: cpf)
        
        //then
        XCTAssertFalse(validationResponse, "Less than 11 digits is valid when it shouldn't be.")
        
    }
    
    func testMoreDigitsIsInvalid() {
        
        // given
        let cpf = "546447579690"
        
        //when
        let validationResponse = validatorUnderTest.validate(document: cpf)
        
        //then
        XCTAssertFalse(validationResponse, "More than 11 digits is valid when it shouldn't be.")
        
    }
    
    func testNoNumberDigitsIsInvalid() {
        
        // given
        let cpf = "546447a7969"
        
        //when
        let validationResponse = validatorUnderTest.validate(document: cpf)
        
        //then
        XCTAssertFalse(validationResponse, "Non-numeric digit is valid when it shouldn't be.")
        
    }
    
    func testFalsePositiveIsInvalid() {
        
        // given
        let cpf = "44444444444"
        
        //when
        let validationResponse = validatorUnderTest.validate(document: cpf)
        
        //then
        XCTAssertFalse(validationResponse, "A false positive is valid when it shouldn't be.")
        
    }
    
    func testValidDocumentNumber() {
        
        // given
        let cpf = "54644757969"
        
        //when
        let validationResponse = validatorUnderTest.validate(document: cpf)
        
        //then
        XCTAssertTrue(validationResponse, "A valid cpf is being checked as invalid.")
        
    }
    
}
