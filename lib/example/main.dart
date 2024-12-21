

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
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomFormW(
              formKey: _formKey, 
              onSubmit: () {
                print('Submitted');
              },
              numberOfFields: 5,
              requiredFieldIndices: [1, 2, 4],
              labelText: ['Name', 'Email', 'Phone', 'Address', 'City'],
              // Added some optional parameters 
              fillColor: Colors.white,
              buttonColor: Colors.blue,
              radius: 8,
              spacing: 15,
              keyboardType: [
                TextInputType.name,
                TextInputType.emailAddress,
                TextInputType.phone,
                TextInputType.streetAddress,
                TextInputType.text
              ],
            ),
          ),
        ],
      ),
    );
  }
}