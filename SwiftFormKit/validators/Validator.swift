//
//  Validator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation

protocol Validator {
    func validate(value: String?) -> Bool
    func errorMessage() -> String
}

struct GenericValidator: Validator {
    private let validation: (String?) -> Bool
    private let message: String

    init(validation: @escaping (String?) -> Bool, message: String) {
        self.validation = validation
        self.message = message
    }
    
    func validate(value: String?) -> Bool {
        return validation(value)
    }
    
    func errorMessage() -> String {
        return message
    }
}

struct RegexValidator: Validator {
    let pattern: String
    let errorMessageText: String
    
    func validate(value: String?) -> Bool {
        guard let value = value else { return false }
        let regexTest = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regexTest.evaluate(with: value)
    }
    
    func errorMessage() -> String {
        return errorMessageText
    }
}
