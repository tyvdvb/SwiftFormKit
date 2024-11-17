//
//  DateField.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public class DateField: ObservableObject, FormFieldProtocol {
    public var id = UUID()
    public var label: String
    @Published public var selectedDate: Date = Date()
    @Published public var validationMessage: String? = nil
    public var validator: ((Date) -> Bool)?
    
    public init(label: String, validator: ((Date) -> Bool)? = nil) {
        self.label = label
        self.validator = validator
    }
    
    public func validate() -> Bool {
        if let validator = validator, !validator(selectedDate) {
            validationMessage = "Date cannot be in the future."
            return false
        } else {
            validationMessage = nil
            return true
        }
    }
}
