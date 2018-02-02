//
//  ValidationView.swift
//  DataValitation-MVP
//
//  Created by Tatiana Magdalena on 02/02/18.
//  Copyright © 2018 Tatiana Magdalena. All rights reserved.
//

import Foundation

@objc protocol ValidationView {
    func onCPFInvalid()
    func onNameInvalid()
    func onEmailInvalid()
    func onReadyToValidate()
}
