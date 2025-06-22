

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
       CustomFormW(
                buttonShape: BeveledRectangleBorder(), //shape for your button
                formKey: formKey,
                buttonText: 'Register',
                onSubmit: () {
                  
                  // Handle form submission
                  print('Name: ${nameController.text}');
                  print('Email: ${emailController.text}');
                  print('Password: ${passwordController.text}');
                },
                children: [
                  CustomTextField(
                    label: 'Full Name',//optional 

                    controller: nameController,
                    isRequired: true,
                    prefixIcon: Icon(Icons.person),
                    withoutLabel: true,//if you do not wanna label 
                    readOnly: true, // if u wanna the text field be read only 
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    isRequired: true,
                    type: CustomTextFieldType.email,
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.all(10),// if you wanna add content padding 
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
                    visibiltyColor: Colors.grey,
                    isRequired: true,
                    type: CustomTextFieldType.password,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  CustomTextField(
                    label: 'Confirm Password',
                    controller: confirmPasswordController,
                    isRequired: true,
                    type: CustomTextFieldType.password,
                    isConfirmPassword: true,
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                  CustomTextField(
                    label: 'phone ',
                    controller: phoneController,
                    isRequired: true,
                    type: CustomTextFieldType.phone,
                    showCountryFlag: false, //if you do not want to show country flag  ,
                    dropDownIcon: Icon(Icons.keyboard_arrow_down_outlined),
                    isConfirmPassword: true,
                    prefixIcon: Icon(Icons.lock_outline),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
   }
}