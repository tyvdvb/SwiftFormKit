//
//  DropdownFieldView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public struct DropdownFieldView: View {
    @ObservedObject var field: DropdownField

    public var body: some View {
        VStack(alignment: .leading) {
            Text(field.label)
                .font(.headline)
            Picker("Select \(field.label)", selection: $field.selectedOption) {
                ForEach(field.options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .onChange(of: field.selectedOption) { _ in
                _ = field.validate()
            }
            if let message = field.validationMessage {
                Text(message)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 5)
    }
}

