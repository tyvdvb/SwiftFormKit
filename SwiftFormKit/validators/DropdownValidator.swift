//
//  DropdownValidator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation

struct DropdownValidator: Validator {
    let options: [String]
    
    func validate(value: String?) -> Bool {
        guard let value = value else { return false }
        return options.contains(value)
    }

    func errorMessage() -> String {
        return "Please select a valid option."
    }
}
