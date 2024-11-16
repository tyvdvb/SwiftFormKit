//
//  DropdownView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-15.
//

import Foundation
import UIKit

class DropdownView: UIView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private var field: FormField
    private var pickerView: UIPickerView
    private var options: [String]

    init(field: FormField, options: [String]) {
        self.field = field
        self.options = options
        self.pickerView = UIPickerView()
        super.init(frame: .zero)
        setupPickerView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupPickerView() {
        pickerView.dataSource = self
        pickerView.delegate = self
        addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pickerView.topAnchor.constraint(equalTo: topAnchor),
            pickerView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
}
