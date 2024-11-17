//
//  FormData.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation

public struct FormData: Codable {
    var fields: [String: String]
    
    public init(fields: [String: String]) {
        self.fields = fields
    }
}
