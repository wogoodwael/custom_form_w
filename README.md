# CustomFormW

A flexible and customizable form widget for Flutter that allows for dynamic form creation with validation, custom labels, styling, and more.
## Example
```dart
import 'package:custom_form_w/custom_form_w.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Custom Form Widget',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomFormW(
            numberOfFields: 5,
            requiredFieldIndices: [1, 2, 4],
            labelText: ['Name', 'Email', 'Phone', 'Address', 'City'],
          )),
        ],
      ),
    );
  }
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
## Screenshots
![Screenshot](https://github.com/wogoodwael/custom_form_w/blob/main/image_one.jpeg)
![Screenshot](https://github.com/wogoodwael/custom_form_w/blob/main/image_two.jpeg)
![Screenshot](https://github.com/wogoodwael/custom_form_w/blob/main/image_three.jpeg)
## Installation

Add this to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_form_w: ^0.0.2
```

then run `flutter pub get`
