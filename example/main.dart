

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
                    label: 'Full Name',
                    controller: nameController,
                    isRequired: true,
                    prefixIcon: Icon(Icons.person),
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: emailController,
                    isRequired: true,
                    type: CustomTextFieldType.email,
                    prefixIcon: Icon(Icons.email),
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: passwordController,
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
                ],
              )
            ],
          ),
        ),
      ),
    );
   }
}