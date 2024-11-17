//
//  FormModel.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation


public class FormModel: ObservableObject {
    @Published public var fields: [any FormFieldProtocol]
    @Published public var isValid: Bool = false
    //    public var isValid: Bool {
    //        fields.allSatisfy { $0.validate() }
    //    }
    //
    public init(fields: [any FormFieldProtocol] = []) {
        self.fields = fields
    }
    
    public func validateAll() -> Bool {
        var isValid = true
        
        for field in fields {
            if let textField = field as? TextInputField {
                let isFieldValid = textField.validate()
                if !isFieldValid {
                    print("Validation failed for TextInputField: \(textField.label)")
                }
                isValid = isValid && isFieldValid
            } else if let dropdownField = field as? DropdownField {
                
                let isFieldValid = !dropdownField.selectedOption.isEmpty
                if !isFieldValid {
                    print("Validation failed for DropdownField: \(dropdownField.label)")
                }
                isValid = isValid && isFieldValid
            } else if let switchField = field as? SwitchField {
            
                let isFieldValid = true
                isValid = isValid && isFieldValid
            } else if let dateField = field as? DateField {
                
                if let validator = dateField.validator {
                    let isFieldValid = validator(dateField.selectedDate)
                    if !isFieldValid {
                        print("Validation failed for DateField: \(dateField.label)")
                    }
                    isValid = isValid && isFieldValid
                } else {
                    print("No validator provided for DateField: \(dateField.label)")
                    isValid = isValid && true
                }
            } else if let textAreaField = field as? TextAreaField {
                
                let isFieldValid = !textAreaField.value.isEmpty
                if !isFieldValid {
                    print("Validation failed for TextAreaField: \(textAreaField.label)")
                }
                isValid = isValid && isFieldValid
            }
        }
        
        self.isValid = isValid
        return isValid
    }
    
    
    
    
    
    public func collectFormData() -> FormData {
        var formValues: [String: String] = [:]
        
        for field in fields {
            if let textInputField = field as? TextInputField {
                formValues[textInputField.label] = textInputField.value
            } else if let dropdownField = field as? DropdownField {
                formValues[dropdownField.label] = dropdownField.selectedOption
            } else if let switchField = field as? SwitchField {
                formValues[switchField.label] = switchField.isOn ? "On" : "Off"
            } else if let dateField = field as? DateField {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                formValues[dateField.label] = dateFormatter.string(from: dateField.selectedDate)
            } else if let textAreaField = field as? TextAreaField {
                formValues[textAreaField.label] = textAreaField.value
            }
        }
        
        return FormData(fields: formValues)
    }
    
    public func saveFormDataToFile() {
        let formData = collectFormData()
        let encoder = JSONEncoder()
        
        
        let fileManager = FileManager.default
        if let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("formData.json")
            
            do {
                
                let jsonData = try encoder.encode(formData)
                
                
                try jsonData.write(to: fileURL)
                
                
                print("Form data saved to: \(fileURL)")
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    print("Saved Data: \(jsonString)")
                }
            } catch {
                print("Failed to save form data: \(error)")
            }
        }
    }
    
    public func clearFields() {
        for field in fields {
            if let textField = field as? TextInputField {
                textField.value = "" 
            } else if let dropdownField = field as? DropdownField {
                dropdownField.selectedOption = dropdownField.options.first ?? ""
            } else if let switchField = field as? SwitchField {
                switchField.isOn = false
            } else if let dateField = field as? DateField {
                dateField.selectedDate = Date()
            } else if let textAreaField = field as? TextAreaField {
                textAreaField.value = ""
            }
        }
    }

    
    
    
    
}
