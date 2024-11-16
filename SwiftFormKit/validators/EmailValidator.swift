//
//  EmailValidator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation

struct EmailValidator: Validator {
    func validate(value: String?) -> Bool {
        guard let value = value, !value.isEmpty else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: value)
    }

    func errorMessage() -> String {
        return "Please enter a valid email address."
    }
}

