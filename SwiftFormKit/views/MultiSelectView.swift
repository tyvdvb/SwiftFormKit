//
//  MultiSelectView.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-15.
//

import Foundation
import UIKit

class MultiSelectView: UIView {
    
    private var field: FormField
    private var segmentedControl: UISegmentedControl
    private var options: [String]
    
    init(field: FormField, options: [String]) {
        self.field = field
        self.options = options
        self.segmentedControl = UISegmentedControl(items: options)
        super.init(frame: .zero)
        setupSegmentedControl()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSegmentedControl() {
        addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor),
            segmentedControl.topAnchor.constraint(equalTo: topAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
