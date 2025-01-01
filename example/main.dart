

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
  final _formKey = GlobalKey<FormState>();

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
                showValidationSnackBar: false,
                formKey: _formKey,
                onSubmit: () {
                  print('Submitted');
                },
                numberOfFields: 7,
                requiredFieldIndices: [2, 3, 4, 5],
                labelText: [
                  'Name',
                  'Email',
                  'Phone',
                  'Password',
                  'Confirm Password',
                  'Address',
                  'City',
                ],
                keyboardType: [
                  TextInputType.text,
                  TextInputType.emailAddress,
                  TextInputType.phone,
                  TextInputType.visiblePassword,
                  TextInputType.visiblePassword,
                  TextInputType.text,
                  TextInputType.text,
                ],
                  suffixIcon: [
                  Icon(Icons.person),
                  Icon(Icons.email),
                  Icon(Icons.phone),
                  //if you want to hide the icon just pass null
                  Icon(null),
                  Icon(null),
                  Icon(null),
                  Icon(Icons.location_city),
                ],
              ),
            ],
          ),
        ),
      ),
    );
   }
}