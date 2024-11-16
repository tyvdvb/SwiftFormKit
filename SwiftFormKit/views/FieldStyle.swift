//
//  FieldStyle.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-13.
//

import Foundation
import UIKit

struct FieldStyle {
    public var backgroundColor: UIColor
    public var textColor: UIColor
    public var font: UIFont
    public var borderStyle: UITextField.BorderStyle
    
    public init(backgroundColor: UIColor, textColor: UIColor, font: UIFont, borderStyle: UITextField.BorderStyle) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.font = font
        self.borderStyle = borderStyle
    }
}
