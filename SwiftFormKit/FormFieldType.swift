//
//  FormFieldType.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation

public enum FormFieldType {
    case text
    case email
    case password
    case phone
    case address
    case dropdown(options: [String])
    case datePicker
    case multiSelect(options: [String])
}

public struct FormField {
    var id: String
    var type: FormFieldType
    var label: String
    var value: String?
    var validators: [Validator]
    var displayCondition: ((Form) -> Bool)?
    var style: FieldStyle? 
    
    init(id: String, type: FormFieldType, label: String, value: String? = nil, validators: [Validator] = [], displayCondition: ((Form) -> Bool)? = nil, style: FieldStyle? = nil) {
        self.id = id
        self.type = type
        self.label = label
        self.value = value
        self.validators = validators
        self.displayCondition = displayCondition
        self.style = style
    }
}
