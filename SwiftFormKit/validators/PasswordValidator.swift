//
//  PasswordValidator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation

struct PasswordValidator: Validator {
    private let minLength: Int
    private let requiresUppercase: Bool
    private let requiresNumber: Bool
    private let requiresSpecialCharacter: Bool
    
    init(minLength: Int = 8, requiresUppercase: Bool = true, requiresNumber: Bool = true, requiresSpecialCharacter: Bool = true) {
        self.minLength = minLength
        self.requiresUppercase = requiresUppercase
        self.requiresNumber = requiresNumber
        self.requiresSpecialCharacter = requiresSpecialCharacter
    }
    
    func validate(value: String?) -> Bool {
        guard let value = value, !value.isEmpty else { return false }
        if value.count < minLength { return false }
        if requiresUppercase && !value.contains(where: { $0.isUppercase }) { return false }
        if requiresNumber && !value.contains(where: { $0.isNumber }) { return false }
        if requiresSpecialCharacter && !value.contains(where: { "!@#$%^&*()_-+=<>?/".contains($0) }) { return false }
        return true
    }
    
    func errorMessage() -> String {
        var message = "Password must be at least \(minLength) characters"
        if requiresUppercase { message += ", include an uppercase letter" }
        if requiresNumber { message += ", include a number" }
        if requiresSpecialCharacter { message += ", and include a special character" }
        return message
    }
}
