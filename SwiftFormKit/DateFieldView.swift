//
//  DateFieldView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public struct DateFieldView: View {
    @ObservedObject var field: DateField
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(field.label)
                .font(.headline)
            
            DatePicker("", selection: $field.selectedDate, displayedComponents: .date)
                .labelsHidden()
                .onChange(of: field.selectedDate) { _ in
                    _ = field.validate() // Validate whenever date changes
                }
            
            if let message = field.validationMessage {
                Text(message)
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 8)
    }
}

