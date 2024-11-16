//
//  FormFieldView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-15.
//

import Foundation
import UIKit

public class FormFieldCell: UITableViewCell {
    
    private var field: FormField
    private var fieldView: UIView?
    
    public static let identifier = "FormFieldCell"

    public init(field: FormField) {
        self.field = field
        super.init(style: .default, reuseIdentifier: FormFieldCell.identifier)
        setupFieldView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupFieldView() {
        switch field.type {
        case .text:
            fieldView = TextFieldView(field: field)
        case .email:
            fieldView = TextFieldView(field: field)
        case .password:
            fieldView = TextFieldView(field: field)
        case .phone:
            fieldView = TextFieldView(field: field)
        case .address:
            fieldView = TextFieldView(field: field)
        case .dropdown(let options):
            fieldView = DropdownView(field: field, options: options)
        case .datePicker:
            fieldView = DatePickerView(field: field)
        case .multiSelect(let options):
            fieldView = MultiSelectView(field: field, options: options)
        }

        guard let fieldView = fieldView else { return }
        
        contentView.addSubview(fieldView)
        fieldView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            fieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            fieldView.topAnchor.constraint(equalTo: contentView.topAnchor),
            fieldView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
