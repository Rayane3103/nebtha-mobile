
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
  final String fullName;
  final String relativeValue;
  final String genderValue;
  final String dateOfBirthValue;
  final String height;
  final String weight;

  const SignUp3({
    super.key,
    required this.email,
    required this.password,
    required this.fullName,
    required this.relativeValue,
    required this.genderValue,
    required this.dateOfBirthValue,
    required this.height,
    required this.weight,
  });

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  List<String> selectedOptions = [];

 Future<String?> _registerUser() async {
  final email = widget.email;
  final password = widget.password;

  final emailPasswordResponse = await http.post(
    Uri.parse('https://nebta.onrender.com/api/Account'),
    body: jsonEncode({
      'email': email,
      'password': password,
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );

  if (emailPasswordResponse.statusCode == 200) {
    print(jsonDecode(emailPasswordResponse.body));
    final token = jsonDecode(emailPasswordResponse.body)['data']['addNewAccount']['token'];
    final id = jsonDecode(emailPasswordResponse.body)['data']['addNewAccount']['_id'];
    
    final maladiesString = selectedOptions.join(',');

  final otherDataResponse = await http.post(
    Uri.parse('https://nebta.onrender.com/api/Profile'),
    body: jsonEncode({
      'fullname': widget.fullName,
      'relative': widget.relativeValue,
      'gender': widget.genderValue,
      'DateOfBirth': widget.dateOfBirthValue,
      'height': widget.height,
      'weight': widget.weight,
      'maladieCronique': maladiesString,
    }),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
  );
      final profileId = jsonDecode(emailPasswordResponse.body)['data']['addNewProfile']['_id'];



  if (otherDataResponse.statusCode == 200) {
    print('Other data response body: ${otherDataResponse.body}');

final LastDataResponse = await http.patch(
    Uri.parse('https://nebta.onrender.com/api/Account/$id'),
    body: jsonEncode({
      'profileId': '$profileId',
    }),
    headers: {
      'Content-Type': 'application/json',
    },
  );


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyMainWidget()),
    );
  } else {
    print('Error posting other data: ${otherDataResponse.body}');
  }
}
 

  final maladiesString = selectedOptions.join(',');
  return null;

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
                        MaterialPageRoute(builder: (context) => const SignUp2(email: '', password: '',)),
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
                                    selectedOptions: selectedOptions,
                                    onChanged: (List<String> newSelectedOptions) {
                                      setState(() {
                                        selectedOptions = newSelectedOptions;
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
  children: selectedOptions.map((option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOptions.remove(option);
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
  if (selectedOptions.isNotEmpty) {
   _registerUser();


    print('Selected Options: $selectedOptions');
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
