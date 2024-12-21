# CustomFormW

A flexible and customizable form widget for Flutter that allows for dynamic form creation with validation, custom labels, styling, and more.
## Screenshots
![CustomFormW Example](screenshots/image_one.jpeg)
![CustomFormW Example](screenshots/image_two.jpeg)
![CustomFormW Example](screenshots/image_three.jpeg)
## Example
```dart
import 'package:custom_form_w/custom_form_w.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: CustomFormW(
          numberOfFields: 3,
          requiredFieldIndices: [1, 2],
          labelText: ['Name', 'Email', 'Phone'],
          onSubmit: () {
            print('Form submitted');
          },
        ),
      ),
    ),
  );
}
```
## Features
- Create dynamic forms with a specified number of fields.
- Highlight required fields with asterisks (*).
- Customize field labels, hints, and styles.
- Supports multiple input types (e.g., text, email).
- Easy-to-use validation for required fields.
- Configurable submit button with custom text, color, and action.
- Customizable border styles and form layout.
- Optional submit button visibility.
## Parameters:
- numberOfFields: Required - Number of fields in the form.    
- requiredFieldIndices: Required - List of indices (1-based) of required fields.
- labelText: Required - List of labels for each field.
- controllers: Required - List of TextEditingController for managing text input.
- formKey: Optional - A GlobalKey<FormState> for form validation.
- buttonText: Optional - Text for the submit button (default: 'Submit').
- buttonColor: Optional - Color for the submit button (default: Colors.blue).
- buttonTextStyle: Optional - Style for the submit button text (default: TextStyle(color: Colors.white)).
- suffixIcon, prefixIcon: Optional - Widgets for icons that appear at the end or start of the input fields.
- keyboardType: Optional - List of keyboard types for each input field (e.g., TextInputType.emailAddress).
- labelStyle: Optional - TextStyle for labels.
- requiredColor, labelColor: Optional - Color options for the labels.
- radius: Optional - Border radius for input fields (default: 10.0).
- onSubmit: Optional - Callback function for form submission.
- showButton: Optional - Whether to show the submit button (default: true).
- spacing: Optional - Spacing between fields (default: 10.0).
- enabledBorderColor, focusedBorderColor: Optional - Colors for input field borders.
- hintStyle: Optional - TextStyle for the hint text.
- hintText: Optional - List of hint texts for the fields.

## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_form_w: ^1.1.0
```
## Then run 
`flutter pub get`

