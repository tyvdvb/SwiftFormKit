//
//  PasswordValidator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//


import Foundation

public struct PasswordValidator: Validator {
    public let errorMessage = "Password must contain at least 8 characters, one uppercase letter, one lowercase letter, and one number"

    public init() {}

    public func validate(value: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordTest.evaluate(with: value)
    }
}
