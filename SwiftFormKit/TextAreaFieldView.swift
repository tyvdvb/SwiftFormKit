//
//  TextAreaFieldView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import SwiftUI

public struct TextAreaFieldView: View {
    @ObservedObject var field: TextAreaField
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(field.label)
                .font(.headline)
            
            TextEditor(text: $field.value)
                .frame(height: 100)
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 8).strokeBorder(Color.gray))
                .onChange(of: field.value) { _ in
                    _ = field.validate() 
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
