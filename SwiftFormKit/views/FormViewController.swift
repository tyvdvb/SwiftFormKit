//
//  FormViewController.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-15.
//

import Foundation
import UIKit

public class FormViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var formFields: [FormField]
    private var tableView: UITableView!

    public init(formFields: [FormField]) {
        self.formFields = formFields
        super.init(nibName: nil, bundle: nil)
        setupTableView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTableView() {
        tableView = UITableView()
        tableView.register(FormFieldCell.self, forCellReuseIdentifier: FormFieldCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formFields.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = formFields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormFieldCell.identifier, for: indexPath) as! FormFieldCell
        cell.setupFieldView() // Reconfigure cell's view based on the form field type
        return cell
    }
}
