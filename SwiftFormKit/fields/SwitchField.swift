//
//  SwitchField.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public class SwitchField: ObservableObject, FormFieldProtocol {
    public let id = UUID()
    let label: String
    @Published var isOn: Bool
    public var validationMessage: String?
    
    private let validator: ((Bool) -> Bool)? 
    
    public init(label: String, isOn: Bool = false, validator: ((Bool) -> Bool)? = nil) {
        self.label = label
        self.isOn = isOn
        self.validator = validator
    }
    
    public func validate() -> Bool { // Matches 'validate' requirement
        guard let validator = validator else { return true }
        let isValid = validator(isOn)
        validationMessage = isValid ? nil : "\(label) is invalid"
        return isValid
    }
}
