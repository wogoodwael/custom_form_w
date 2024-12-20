

import 'package:flutter/material.dart';

class CustomFormW extends StatelessWidget {
  const CustomFormW({
    super.key,
    required this.numberOfFields,
    required this.requiredFieldIndices,
    this.withoutBorder = false,
    required this.labelText,
    this.textDirection = TextDirection.ltr,
    this.fillColor = Colors.white,
    this.controllers,
    this.formKey,
    this.buttonText = 'Submit',
    this.buttonColor = Colors.blue,
    this.buttonTextStyle = const TextStyle(color: Colors.white),
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.labelStyle,
    this.requiredColor,
    this.labelColor,
    this.radius,
    this.onSubmit,
    this.showButton = true,
    this.spacing,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.hintStyle,
    this.hintText,
  });

  final int numberOfFields;
  final List<int> requiredFieldIndices; 
  final bool? withoutBorder;
  final List<String> labelText;
  final TextDirection? textDirection;
  final Color? fillColor;
  final List<TextEditingController> ? controllers;
  final GlobalKey<FormState> ? formKey;
  final String? buttonText;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputType> ? keyboardType;
  final TextStyle? labelStyle;
  final Color? requiredColor;
  final Color? labelColor;
  final double? radius;
  final Function()? onSubmit;
  final bool showButton;
  final double? spacing;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final TextStyle? hintStyle;
  final List<String> ? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: spacing ?? 10,
          children: [
            Column(
              spacing: spacing ?? 10,
              children: List.generate(numberOfFields, (index) => Directionality(
                textDirection: textDirection ?? TextDirection.ltr,
                child: TextFormField(
                  keyboardType: keyboardType?[index],
                  key: formKey,
                  controller: controllers?[index],
                  textDirection: textDirection,
                  decoration: InputDecoration(
            
                    labelText:withoutBorder == true ? null:'${labelText[index]}${requiredFieldIndices.contains(index+1) ? ' *' : ''}',
                    labelStyle:  labelStyle ?? TextStyle(color: requiredFieldIndices.contains(index+1) ? requiredColor ?? Colors.red : labelColor ?? Colors.black   ),
                    hintText:hintText?[index] ?? 'Enter ${labelText[index]}',
                    hintStyle: hintStyle ?? TextStyle(color: Colors.grey.withOpacity(0.5)),
                    hintTextDirection: textDirection,
                    filled: true,
                    fillColor:fillColor,
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    border: withoutBorder == true ? InputBorder.none : OutlineInputBorder(),
                    enabledBorder: withoutBorder == true ? InputBorder.none : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      borderSide: BorderSide(color: enabledBorderColor ?? Colors.grey.withOpacity(0.5)),
                    ),
                    focusedBorder: withoutBorder == true ? InputBorder.none : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius ?? 10),
                      borderSide: BorderSide(color: focusedBorderColor ?? Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  validator: (value) {
                    if (requiredFieldIndices.contains(index+1) && (value == null || value.isEmpty)) {
                      return 'Please enter ${labelText[index]}';
                    }
                    if (numberOfFields <= 0) {
                      return 'Number of fields must be greater than 0';
                    }
                    return null;
                  },
                ),
              )),

            ), 
        showButton == true ? MaterialButton(
              minWidth: .9*MediaQuery.sizeOf(context).width,
              height: 45,
              color: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              onPressed: () {
                if (formKey?.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 90),
                    content: Text('Form is valid')));
                  print('Form is valid');
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.red,
                    margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 90),
                    content: Text('Form is invalid')));
                }
                if(onSubmit != null){
                  onSubmit!();
                }
              },
              child: Text(buttonText ?? 'Submit' , style: buttonTextStyle),
            ) : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
