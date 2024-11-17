//
//  FormFieldProtocol.swift
//  SwiftFormKit
//
//  Created by Ira Nazar on 2024-11-17.
//

import Foundation
import SwiftUI

public protocol FormFieldProtocol: Identifiable, ObservableObject {
     var id: UUID { get }
     var validationMessage: String? { get set }
     func validate() -> Bool
}
