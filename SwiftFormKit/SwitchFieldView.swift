//
//  SwitchFieldView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public struct SwitchFieldView: View {
    @ObservedObject var field: SwitchField

    public var body: some View {
        VStack(alignment: .leading) {
            Text(field.label)
                .font(.headline)
            Toggle(isOn: $field.isOn) {
                Text(field.label)
            }
            .onChange(of: field.isOn) { _ in
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

