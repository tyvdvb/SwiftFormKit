//
//  PhoneValidator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation

struct PhoneValidator: Validator {
    func validate(value: String?) -> Bool {
        guard let value = value, !value.isEmpty else { return false }
        let phoneRegEx = "^[0-9]{10}$"
        return NSPredicate(format: "SELF MATCHES %@", phoneRegEx).evaluate(with: value)
    }

    func errorMessage() -> String {
        return "Please enter a valid phone number."
    }
}

