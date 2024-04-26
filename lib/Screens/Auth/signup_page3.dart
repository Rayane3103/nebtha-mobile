
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nebtha/Components/customNavbar.dart';
import 'package:nebtha/Constants/constants.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/Auth/signup_page2.dart';
import 'package:http/http.dart' as http;

class SignUp3 extends StatefulWidget {
  final String email;
  final String password;
  final String phoneNumber;
  final String fullname;
  final String relative;
  final String gender;
  final String DateOfBirth;
  final String height;
  final String weight;

  const SignUp3({
    super.key,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.fullname,
    required this.relative,
    required this.gender,
    required this.DateOfBirth,
    required this.height,
    required this.weight,
  });

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  List<String> maladieCronique = [];

 
  Future<void> signUp() async {
  // Construct the request body
  final Map<String, dynamic> requestBody = {
    'email': widget.email,
    'password': widget.password,
    'phoneNumber': widget.phoneNumber,
    'fullname': widget.fullname,
    'relative': widget.relative,
    'gender': widget.gender,
    'DateOfBirth': widget.DateOfBirth,
    'height': widget.height,
    'weight': widget.weight,
    'maladieCronique': maladieCronique,
  };

  // Convert the request body to JSON
  final String requestBodyJson = json.encode(requestBody);

  try {
    // Make the POST request
    final response = await http.post(
      Uri.parse('https://nebta.onrender.com/api/singUp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBodyJson,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Handle successful response
      print('Sign up successful');
      print('Response: ${response.body}');
      
      // Navigate to the next screen or perform any other action
    } else {
      // Handle unsuccessful response
      print('Failed to sign up');
      print('Error code: ${response.statusCode}');
      print('Error message: ${response.body}');
      
      // Show an error message or retry the request
    }
  } catch (error) {
    // Handle errors during the request
    print('Error during sign up: $error');
    
    // Show an error message or retry the request
  }
}


    
 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Row(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                width: 48,
                height: 48,
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp2(email: '', password: '',phoneNumber: '',)),
                      );
                    },
                    iconSize: 30,
                    color: primaryColor,
                    icon: const Icon(Icons.chevron_left_rounded),
                  ),
                ),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            const Text('Creér votre compte Nebtha', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 160,
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: const [BoxShadow(blurRadius: 1)],
                    ),
                    width: 360,
                    height: 580,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ListView(
                                children: [
                                  MultiSelectDropdown(
                                    hintText: 'Maladie Chronique',
                                    options: maladies,
                                    selectedOptions: maladieCronique,
                                    onChanged: (List<String> newSelectedOptions) {
                                      setState(() {
                                        maladieCronique = newSelectedOptions;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(14),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(width: 2, color: primaryColor),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: const BorderSide(width: 2),
                                      ),
                                    ),
                                  ),
                                  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text('Maladies:', style: TextStyle(fontWeight: FontWeight.bold)),
    const SizedBox(height: 8),
    Wrap(
  spacing: 8,
  children: maladieCronique.map((option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          maladieCronique.remove(option);
        });
      },
      child: Chip(
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),),
        backgroundColor: primaryColor,
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(option,style: const TextStyle(color: Colors.white),),
            const SizedBox(width: 4),
            const Icon(Icons.close, size: 14,color: Colors.white,),
          ],
        ),
      ),
    );
  }).toList(),
),
  ],
),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                              onPressed: () {
  if (maladieCronique.isNotEmpty) {
  


    print('Selected Options: $maladieCronique');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyMainWidget()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please select at least one option.'),
      ),
    );
  }
},
                              child: const Text('Submit', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.07,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class MultiSelectDropdown extends StatelessWidget {
  final String hintText;
  final List<String> options;
  final List<String> selectedOptions;
  final void Function(List<String>) onChanged;
  final InputDecoration decoration;

  const MultiSelectDropdown({
    super.key,
    required this.hintText,
    required this.options,
    required this.selectedOptions,
    required this.onChanged,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DropdownButtonFormField<String>(
            isDense: true,
            hint: Text(hintText),
            value: selectedOptions.isEmpty ? null : selectedOptions.first,
            onChanged: (String? newValue) {
              final List<String> newSelectedOptions = List<String>.from(selectedOptions);
              if (newSelectedOptions.contains(newValue)) {
                newSelectedOptions.remove(newValue);
              } else {
                newSelectedOptions.add(newValue!);
              }
              onChanged(newSelectedOptions);
            },
            items: options.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            decoration: decoration,
          ),
        ],
      ),
    );
  }
}
