//
//  Validator.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation

public protocol Validator {
    func validate(value: String) -> Bool
    var errorMessage: String { get }
}
