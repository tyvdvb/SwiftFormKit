//
//  TextInputField.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public class TextInputField: ObservableObject, FormFieldProtocol {
    public let id = UUID() 
    public let label: String
    @Published public var value: String = ""
    public var validationMessage: String?
    
    private let validators: [Validator]
    
    public init(label: String, value: String = "", validators: [Validator] = []) {
        self.label = label
        self.value = value
        self.validators = validators
    }
    
    public func validate() -> Bool {
        var isValid = true
        
        for validator in validators {
            if !validator.validate(value: value) {
                validationMessage = validator.errorMessage
                isValid = false
            }
        }
        
        if isValid {
            validationMessage = nil
        }
        return isValid
    }
}



