//
//  FormView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//
import Foundation
import SwiftUI

public struct FormView: View {
    @ObservedObject public var model: FormModel
    
    
    public init(model: FormModel) {
        self.model = model
    }
    
    public var body: some View {
        VStack {
            ForEach(model.fields.indices, id: \.self) { index in
                let field = model.fields[index]
                if let textInputField = field as? TextInputField {
                    TextInputView(field: textInputField)
                } else if let dropdownField = field as? DropdownField {
                    DropdownFieldView(field: dropdownField)
                } else if let switchField = field as? SwitchField {
                    SwitchFieldView(field: switchField)
                } else if let dateField = field as? DateField {
                    DateFieldView(field: dateField)
                } else if let textAreaField = field as? TextAreaField {
                    TextAreaFieldView(field: textAreaField)
                }
            }
            
            Button(action: {
                if model.validateAll() {
                    print("Form is valid!")
                    model.saveFormDataToFile()
//                    model.clearFields()
                    
                } else {
                    print("Form validation failed.")
                }
            }) {
                Text("Validate")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
            
        }
        .padding()
    }
}

