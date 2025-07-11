import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomFormW extends StatefulWidget {
  const CustomFormW({
    super.key,
    required this.children,
    this.formKey,
    this.buttonText = 'Submit',
    this.buttonColor = Colors.blue,
    this.buttonTextStyle = const TextStyle(color: Colors.white),
    this.onSubmit,
    this.showButton = true,
    this.spacing = 10,
    this.validationSnackBarText,
    this.showValidationSnackBar = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.spaceHeaders = 5,
    this.buttonShape
  });

  final List<CustomTextField> children;
  final GlobalKey<FormState>? formKey;
  final String buttonText;
  final Color buttonColor;
  final TextStyle buttonTextStyle;
  final Function()? onSubmit;
  final bool showButton;
  final double spacing;
  final double spaceHeaders;
  final String? validationSnackBarText;
  final bool showValidationSnackBar;
  final EdgeInsetsGeometry padding;
  final ShapeBorder? buttonShape;

  @override
  State<CustomFormW> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomFormW> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey ?? _formKey,
      child: Padding(
        padding: widget.padding,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    children: List.generate(
                      widget.children.length,
                      (index) {
                        final childWidget = widget.children[index];

                        return Padding(
                            padding: EdgeInsets.only(bottom: widget.spacing),
                            child: Column(
                              spacing: widget.spaceHeaders,
                              crossAxisAlignment:
                                  childWidget.crossAxisOfHeaderText ??
                                      CrossAxisAlignment.start,
                              children: [
                                if (childWidget.headerText != null)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Text(
                                      childWidget.headerText!,
                                      style: childWidget.headerTextStyle,
                                    ),
                                  ),
                                childWidget.copyWith(
                                  parentPassword: _password,
                                  onPasswordChanged: (value) {
                                    if (widget.children[index].type ==
                                            CustomTextFieldType.password &&
                                        !widget.children[index]
                                            .isConfirmPassword) {
                                      _password = value;
                                    }
                                  },
                                ),
                              ],
                            ));
                      },
                    ),
                  ),
                ),
              ),
              if (widget.showButton)
                MaterialButton(
                  minWidth: .9 * MediaQuery.of(context).size.width,
                  height: 45,
                  color: widget.buttonColor,
                  shape: widget.buttonShape ??
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                  onPressed: () {
                    final formKey = widget.formKey ?? _formKey;
                    if (formKey.currentState!.validate()) {
                      if (widget.showValidationSnackBar) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                            margin: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height - 90,
                            ),
                            content: Text(
                              widget.validationSnackBarText ?? 'Form is valid',
                            ),
                          ),
                        );
                      }

                      if (widget.onSubmit != null) {
                        widget.onSubmit!();
                      }
                    } else if (widget.showValidationSnackBar) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.red,
                          margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height - 90,
                          ),
                          content: Text('Please fill in all required fields'),
                        ),
                      );
                    }
                  },
                  child: Text(widget.buttonText, style: widget.buttonTextStyle),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

enum CustomTextFieldType {
  text,
  email,
  password,
  phone,
  number,
}

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.label,
      this.hint,
      this.controller,
      this.isRequired = false,
      this.type = CustomTextFieldType.text,
      this.withoutLabel = false,
      this.textDirection = TextDirection.ltr,
      this.fillColor = Colors.white,
      this.prefixIcon,
      this.suffixIcon,
      this.labelStyle,
      this.requiredColor = Colors.red,
      this.labelColor = Colors.black,
      this.radius = 10,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.hintStyle,
      this.phoneRegex = r'^\d{10}$',
      this.phoneRegexError = 'Please enter a valid 10-digit phone number',
      this.passwordRegex,
      this.passwordRegexError,
      this.passwordLength = 8,
      this.isConfirmPassword = false,
      this.parentPassword,
      this.onPasswordChanged,
      this.headerText,
      this.headerTextStyle,
      this.crossAxisOfHeaderText,
      this.readOnly = false,
      this.visibiltyColor,
      this.dropDownIcon,
      this.contentPadding,
      this.showCountryFlag = true,
      this.maxLength,
      this.maxLines,
  });

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final bool isRequired;
  final CustomTextFieldType type;
  final bool withoutLabel;
  final TextDirection textDirection;
  final Color fillColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? labelStyle;
  final Color requiredColor;
  final Color labelColor;
  final double radius;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final TextStyle? hintStyle;
  final String phoneRegex;
  final String phoneRegexError;
  final String? passwordRegex;
  final String? passwordRegexError;
  final int passwordLength;
  final bool isConfirmPassword;
  final String? headerText;
  final CrossAxisAlignment? crossAxisOfHeaderText;
  final TextStyle? headerTextStyle;
  final bool? readOnly;
  final String? parentPassword;
  final Function(String)? onPasswordChanged;
  final Color? visibiltyColor;
  final Icon? dropDownIcon;
  final EdgeInsetsGeometry? contentPadding;
  final bool? showCountryFlag;
  final int? maxLength;
  final int? maxLines;

  CustomTextField copyWith({
    String? parentPassword,
    Function(String)? onPasswordChanged,
    int? maxLength,
    int? maxLines,
  }) {
    return CustomTextField(
      label: label,
      hint: hint,
      controller: controller,
      isRequired: isRequired,
      type: type,
      withoutLabel: withoutLabel,
      textDirection: textDirection,
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      labelStyle: labelStyle,
      requiredColor: requiredColor,
      labelColor: labelColor,
      radius: radius,
      enabledBorderColor: enabledBorderColor,
      focusedBorderColor: focusedBorderColor,
      hintStyle: hintStyle,
      phoneRegex: phoneRegex,
      phoneRegexError: phoneRegexError,
      passwordRegex: passwordRegex,
      passwordRegexError: passwordRegexError,
      passwordLength: passwordLength,
      isConfirmPassword: isConfirmPassword,
      parentPassword: parentPassword ?? this.parentPassword,
      onPasswordChanged: onPasswordChanged ?? this.onPasswordChanged,
      headerText: headerText,
      headerTextStyle: headerTextStyle,
      crossAxisOfHeaderText: crossAxisOfHeaderText,
      readOnly: readOnly,
      visibiltyColor: visibiltyColor,
      dropDownIcon: dropDownIcon,
      contentPadding: contentPadding,
      showCountryFlag: showCountryFlag,
      maxLength: maxLength ?? this.maxLength,
      maxLines: maxLines ?? this.maxLines,
    );
  }

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection,
      child: widget.type == CustomTextFieldType.phone
          ? _buildPhoneField()
          : _buildTextField(),
    );
  }

  Widget _buildPhoneField() {
    return IntlPhoneField(
      showDropdownIcon: true,
      showCountryFlag: widget.showCountryFlag ?? true,
      dropdownIcon: widget.dropDownIcon ?? Icon(Icons.arrow_drop_down),
      controller: widget.controller,
      decoration: _buildInputDecoration(),
      initialCountryCode: 'EG',
      onChanged: (phone) {},
      onSaved: (phone) {
        if (widget.controller != null && phone != null) {
          widget.controller!.text = phone.completeNumber;
        }
      },
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
      keyboardType: _getKeyboardType(),
      textDirection: widget.textDirection,
      obscureText:
          widget.type == CustomTextFieldType.password && !_passwordVisible,
      decoration: _buildInputDecoration(),
      validator: _validateField,
      onChanged: (value) {
        if (widget.type == CustomTextFieldType.password &&
            !widget.isConfirmPassword &&
            widget.onPasswordChanged != null) {
          widget.onPasswordChanged!(value);
        }
      },
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      labelText: widget.withoutLabel ? null : widget.label,
      labelStyle: widget.labelStyle ??
          TextStyle(
            color: widget.isRequired ? widget.requiredColor : widget.labelColor,
          ),
      hintText: widget.hint ??
          (widget.textDirection == TextDirection.rtl
              ? 'من فضلك ادخل ${widget.label}'
              : ' Please enter ${widget.label}'),
      hintStyle:
          widget.hintStyle ?? TextStyle(color: Colors.grey.withOpacity(0.5)),
      hintTextDirection: widget.textDirection,
      filled: true,
      fillColor: widget.fillColor,
      suffixIcon: widget.type == CustomTextFieldType.password
          ? IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: widget.visibiltyColor,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
          : widget.suffixIcon,
      prefixIcon: widget.prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: BorderSide(
          color: widget.enabledBorderColor ?? Colors.grey.withOpacity(0.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: BorderSide(
          color: widget.enabledBorderColor ?? Colors.grey.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(widget.radius),
        borderSide: BorderSide(
          color: widget.focusedBorderColor ?? Colors.grey.withOpacity(0.5),
        ),
      ),
      contentPadding: widget.contentPadding ?? EdgeInsets.zero
    );
  }

  TextInputType _getKeyboardType() {
    switch (widget.type) {
      case CustomTextFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFieldType.number:
        return TextInputType.number;
      case CustomTextFieldType.phone:
        return TextInputType.phone;
      case CustomTextFieldType.text:
        return TextInputType.text;
    }
  }

  String? _validateField(String? value) {
    if (widget.isRequired && (value == null || value.isEmpty)) {
      return widget.textDirection == TextDirection.rtl
          ? 'من فضلك ادخل ${widget.label}'
          : ' Please enter ${widget.label}';
    }

    switch (widget.type) {
      case CustomTextFieldType.email:
        if (value != null && value.isNotEmpty) {
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Please enter a valid email address';
          }
        }
        break;

      case CustomTextFieldType.password:
        if (value != null && value.isNotEmpty) {
          if (widget.isConfirmPassword) {
            if (value != widget.parentPassword) {
              return 'Passwords do not match';
            }
          } else {
            if (widget.passwordRegex != null) {
              if (!RegExp(widget.passwordRegex!).hasMatch(value)) {
                return widget.passwordRegexError ??
                    'Password does not meet the requirements';
              }
            } else {
              if (value.length < widget.passwordLength) {
                return 'Password must be at least ${widget.passwordLength} characters';
              }
              if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
                return 'Password must contain at least one uppercase letter';
              }
              if (!RegExp(r'(?=.*?[a-z])').hasMatch(value)) {
                return 'Password must contain at least one lowercase letter';
              }
              if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
                return 'Password must contain at least one number';
              }
              if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(value)) {
                return 'Password must contain at least one special character';
              }
            }
          }
        }
        break;

      case CustomTextFieldType.phone:
        if (value != null && value.isNotEmpty) {
          if (!RegExp(widget.phoneRegex).hasMatch(value)) {
            return widget.phoneRegexError;
          }
        }
        break;

      default:
        break;
    }

    return null;
  }
}
