//
//  TextFieldView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-15.
//

import Foundation
import UIKit

class TextFieldView: UIView {
    
    private var field: FormField
    private var textField: UITextField
    
    init(field: FormField) {
        self.field = field
        self.textField = UITextField()
        super.init(frame: .zero)
        setupTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextField() {
        textField.placeholder = field.label
        applyStyle(to: textField)
        addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    private func applyStyle(to textField: UITextField) {
        if let style = field.style {
            textField.backgroundColor = style.backgroundColor
            textField.textColor = style.textColor
            textField.font = style.font
            textField.borderStyle = style.borderStyle
        }
    }
}
