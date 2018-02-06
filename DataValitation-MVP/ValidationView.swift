//
//  ValidationView.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

protocol ValidationView: class {
    func onCPFValidation(_ validation: Validation)
    func onNameValidation(_ validation: Validation)
    func onEmailValidation(_ validation: Validation)
    func onReadyToValidate(_ validation: Validation)
}

enum HexColor: String {
    case darkGray = "#5C666A"
    case red = "#D64541"
}

enum Validation {
    
    case valid
    case invalid(displayMessage: String?)
    
    var colorHex: HexColor {
        switch self {
        case .valid: return .darkGray
        case .invalid: return .red
        }
    }
    
    var message: String {
        switch self {
        case .invalid(let text): return text ?? ""
        default:
            return ""
        }
    }
    
    var booleanValue: Bool {
        switch self {
        case .valid: return true
        case .invalid: return false
        }
    }
}

extension Validation: Equatable {
    static func ==(lhs: Validation, rhs: Validation) -> Bool {
        switch (lhs, rhs) {
        case (.valid, .valid): return true
        case (let .invalid(leftMessage), let .invalid(rightMessage)): return leftMessage == rightMessage
        default:
            return false
        }
    }
}

