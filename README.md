# SwiftFormKit

SwiftFormKit is a framework designed to simplify the creation and validation of forms in iOS applications. 


## Features

✅ Dynamic Form Creation: Easily define forms with multiple field types such as text fields, date pickers, dropdowns, and toggles.

✅ Built-in Validators: Includes pre-defined validators for common data types (e.g., email, phone numbers, passwords).

✅ Automatic Data Validation: Forms are validated dynamically as users input data or on form submission.

✅  SPM & CocoaPods Support: Easily integrate the framework into your project.

✅  SwiftLint Integration: Ensures clean, maintainable code.

## Requirements
- iOS 17.0+
- Swift 5.0+
- Xcode 14+

## Installation

### Using Swift Package Manager (SPM)
1. Open your Xcode project.
2. Go to File > Add Packages.
3. Enter the URL of the SwiftFormKit repository:
      `https://github.com/tyvdvb/SwiftFormKit`
4. Select the latest version and add it to your project.

### Using CocoaPods
```
# Podfile
use_frameworks!

target 'YOUR_TARGET_NAME' do
    pod 'SwiftFormKit'
end
```
Replace **YOUR_TARGET_NAME** and then, in the Podfile directory, type:
`$ pod install`

## Usage

### 1. Creating Form Fields
```
import SwiftFormKit

let emailField = TextInputField(
    label: "Email",
    validators: [EmailValidator()]
)

let passwordField = TextInputField(
    label: "Password",
    validators: [PasswordValidator()]
)

let phoneField = TextInputField(
    label: "Phone Number",
    validators: [PhoneValidator()]
)

let form = FormModel(fields: [emailField, passwordField, phoneField])

 
```
### 2. Create a Form View
```
import SwiftUI
import SwiftFormKit

struct ContentView: View {
    @StateObject var formModel = form
    
    var body: some View {
        FormView(model: formModel)
    }
}
```
## Available Field Types
- **Text Input**: Standard text input field with real-time validation.
- **Dropdown**: A picker that allows the user to select from a list of options.
- **Switch**: A toggle that can be used for binary values.
- **Date**: A date picker for selecting dates.
- **Text Area**: A multi-line text input field.

## Validation
You can use the built-in validators or create your own custom validators.

### Built-in Validators
- **EmailValidator**: Validates email format.
- **PhoneValidator**: Validates phone number format.
- **PasswordValidator**: Validates password strength.

You can create custom validators by implementing the **Validator protocol**.

```
public struct CustomValidator: Validator {
    public let errorMessage = "Custom validation failed"
    
    public init() {}
    
    public func validate(value: String) -> Bool {
        // Your custom validation logic here
        return value.count >= 5
    }
}
```

## Contributions
Contributions are welcome! Feel free to fork the project and create pull requests.

## Screenshot Simulator
<img width="375" alt="image" src="https://github.com/user-attachments/assets/39d52ca6-9d9a-45c3-a58a-e5301cf1af49">

## Screenshot Xcode
<img width="871" alt="image" src="https://github.com/user-attachments/assets/a7b6cfa9-4234-41e8-9d6e-3a6898985f99">
