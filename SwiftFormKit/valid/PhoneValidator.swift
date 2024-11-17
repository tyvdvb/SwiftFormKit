//
//  PhoneValidator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation


public struct PhoneValidator: Validator {
    public let errorMessage = "Invalid phone number format"
    
  
    public init() {}

    public func validate(value: String) -> Bool {
        
        let phoneRegEx = "^\\+?[0-9]*([\\s\\-]?)[0-9]+([\\s\\-]?[0-9]+)*$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: value)
    }
}
