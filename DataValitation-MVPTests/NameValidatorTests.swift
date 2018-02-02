//
//  NameValidatorTests.swift
//  DataValitation-MVPTests
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import XCTest
@testable import DataValitation_MVP

class NameValidatorTests: XCTestCase {
    
    var validatorUnderTest: NameValidator!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        validatorUnderTest = NameValidator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        validatorUnderTest = nil
        super.tearDown()
    }
    
    func testNoLastnameIsInvalid() {
        
        // given
        let name = "Fulano"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        XCTAssertFalse(validationResponse, "Just a first name is valid when it shouldn't be.")
        
    }
    
    func testNoFirstNameIsInvalid() {
        
        // given
        let name = " Silva"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        XCTAssertFalse(validationResponse, "Just a last name is valid when it shouldn't be.")
        
    }
    
    func testMinimumCharactersAmount() {
        
        // given
        let name = "Ab C"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        XCTAssertFalse(validationResponse, "Less than 3 characters is valid when it shouldn't be.")
        
    }
    
    func testMaximumCharactersAmount() {
        
        // given
        let name = "Fulano de Tal da Silva Sauro Orleans e Braganca Souza Martins"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        XCTAssertFalse(validationResponse, "More than 60 characters is valid when it shouldn't be.")
        
    }
    
    func testValidNameAndLastname() {
        
        // given
        let name = "Fulano Sauro"
        
        //when
        let validationResponse = validatorUnderTest.validate(name: name)
        
        //then
        XCTAssertTrue(validationResponse, "A valid name is being checked as invalid.")
        
    }
    
}
