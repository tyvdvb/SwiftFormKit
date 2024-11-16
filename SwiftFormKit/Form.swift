//
//  Form.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation
import UIKit

struct Form {
    var fields: [FormField]
    
    func validate() -> [String: String] {
        var errors = [String: String]()
        
        for field in fields {
            for validator in field.validators {
                if !validator.validate(value: field.value) {
                    errors[field.id] = validator.errorMessage()
                    break // Stop after first error per field
                }
            }
        }
        
        return errors
    }
    
    func createUIForFields() -> [UIView] {
        var uiElements = [UIView]()
        
        for field in fields {
            switch field.type {
            case .text, .email, .password, .phone, .address:
                let textField = UITextField()
                textField.placeholder = field.label
                if let style = field.style {
                    textField.backgroundColor = style.backgroundColor
                    textField.textColor = style.textColor
                    textField.font = style.font
                    textField.borderStyle = style.borderStyle
                }
                uiElements.append(textField)
            case .dropdown(let options):
                let dropdown = UIPickerView()
                uiElements.append(dropdown)
            case .datePicker:
                let datePicker = UIDatePicker()
                uiElements.append(datePicker)
            case .multiSelect(let options):
                let multiSelect = UISegmentedControl(items: options)
                uiElements.append(multiSelect)
            }
        }
        
        return uiElements
    }
}
