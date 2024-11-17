//
//  TextAreaField.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public class TextAreaField: ObservableObject, FormFieldProtocol {
    public var id = UUID()
    public var label: String
    @Published public var value: String = ""
    @Published public var validationMessage: String? = nil
    public var validator: ((String) -> Bool)?
    
    public init(label: String, validator: ((String) -> Bool)? = nil) {
        self.label = label
        self.validator = validator
    }
    
    // Direct validation within the field
    public func validate() -> Bool {
        if let validator = validator, !validator(value) {
            validationMessage = "This field cannot be empty."
            return false
        } else {
            validationMessage = nil
            return true
        }
    }
}

