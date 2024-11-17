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

### Creating a Simple Form
```
import SwiftFormKit

struct MyFormView: View {
    @State private var formData: [String: Any] = [:]
    @State private var isFormValid = false
    
    var body: some View {
        SwiftForm(
            fields: [
                TextFieldItem(id: "name", label: "Name", placeholder: "Enter your full name", validator: .name),
                TextFieldItem(id: "email", label: "Email", placeholder: "Enter your email", validator: .email),
                TextFieldItem(id: "phone", label: "Phone", placeholder: "Enter your phone number", validator: .phone),
                ToggleItem(id: "terms", label: "Agree to Terms"),
            ],
            onSubmit: { data, isValid in
                formData = data
                isFormValid = isValid
                if isValid {
                    print("Form Submitted: \(data)")
                }
            }
        )
    }
}
```
