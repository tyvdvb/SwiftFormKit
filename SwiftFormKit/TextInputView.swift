//
//  TextInputView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public struct TextInputView: View {
    @ObservedObject var field: TextInputField

    public var body: some View {
        VStack(alignment: .leading) {
            Text(field.label)
                .font(.headline)
            TextField("Enter \(field.label)", text: $field.value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: field.value) { _ in
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
