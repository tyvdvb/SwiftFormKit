//
//  DropdownField.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//


import Foundation
import SwiftUI

public class DropdownField: ObservableObject, FormFieldProtocol {
    public let id = UUID()
    let label: String
    @Published var selectedOption: String
    public var validationMessage: String?
    
    public let options: [String]
    private let validator: ((String) -> Bool)?
    
    public init(label: String, options: [String], selectedOption: String = "", validator: ((String) -> Bool)? = nil) {
        self.label = label
        self.options = options
        self.selectedOption = selectedOption
        self.validator = validator
    }
    
    public func validate() -> Bool { 
        guard let validator = validator else { return true }
        let isValid = validator(selectedOption)
        validationMessage = isValid ? nil : "\(label) is invalid"
        return isValid
    }
}
