
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
  List<int> maladieCroniqueIndices = [];
  bool isLoading = false;
Future<Map<String, dynamic>?> FetchProfile(String profileId, String token) async {
  try {
    final response = await http.get(
      Uri.parse('https://nebta.onrender.com/api/Profile/$profileId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print('Fetch Profile successful : ');
      return json.decode(response.body);
      
    } else {
      print('Fetch Profile error');
      print('Error code: ${response.statusCode}');
      print('Error message: ${response.body}');
      return null;
    }
  } catch (error) {
    print('Error $error');
    return null;
  }
}
  Future<void> signUp() async {
    setState(() {
      isLoading = true;
    });
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
    'maladieCronique': maladieCroniqueIndices,
  };

  final String requestBodyJson = json.encode(requestBody);

  try {
    final response = await http.post(
      Uri.parse('https://nebta.onrender.com/api/Account/singUp'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBodyJson,
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      print('Response Body: $responseBody');
      final data = responseBody['data'];
      if (data != null) {
        final profileId = data['Account']['profile'][0];
        final token = data['Account']['token'];
        final profileResponse = await FetchProfile(profileId, token);
        if (profileResponse != null) {
          print(profileResponse);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyMainWidget(profileData: profileResponse),
            ),
          );
        } else {
          print('Failed to fetch profile');
        }
      }
      print('Sign up successful');
      print('Response: ${response.body}');
    } else {
      print('Failed to sign up');
      print('Error code: ${response.statusCode}');
      print('Error message: ${response.body}');
    }
  } catch (error) {
    print('Error during sign up: $error');
  }
  finally {
      setState(() {
        isLoading = false;
      });
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
                        MaterialPageRoute(builder: (context) => const SignUp2(email: '', password: '', phoneNumber: '',)),
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
            const Text('Creér votre compte Nebtha,', style: TextStyle(fontSize: 20,color: Colors.white)),
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
                                    selectedIndices: maladieCroniqueIndices,
                                    onChanged: (List<int> newSelectedIndices) {
                                      setState(() {
                                        maladieCroniqueIndices = newSelectedIndices;
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
                                        children: maladieCroniqueIndices.map((index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                maladieCroniqueIndices.remove(index);
                                              });
                                            },
                                            child: Chip(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              backgroundColor: primaryColor,
                                              label: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(maladies[index-1], style: const TextStyle(color: Colors.white)),
                                                  const SizedBox(width: 4),
                                                  const Icon(Icons.close, size: 14, color: Colors.white),
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
                              onPressed: () async {
                                  print('Selected Options: $maladieCroniqueIndices');
                                  await signUp(); 
        //                           Navigator.pushNamedAndRemoveUntil(
        //   context,
        //   '/main',
        //   (route) => false,
        //   // arguments: profileResponse, // Pass the profile data here
        // );
                                
                              },
                              child:  isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text('Submit', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.07),
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
  final List<int> selectedIndices;
  final void Function(List<int>) onChanged;
  final InputDecoration decoration;

  const MultiSelectDropdown({
    super.key,
    required this.hintText,
    required this.options,
    required this.selectedIndices,
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
            value: selectedIndices.isEmpty ? null : options[selectedIndices.first-1],
            onChanged: (String? newValue) {
              final int newIndex = options.indexOf(newValue!)+1;
              final List<int> newSelectedIndices = List<int>.from(selectedIndices);
              if (newSelectedIndices.contains(newIndex)) {
                newSelectedIndices.remove(newIndex);
              } else {
                newSelectedIndices.add(newIndex);
              }
              onChanged(newSelectedIndices);
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
