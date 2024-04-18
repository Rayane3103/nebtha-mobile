
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// In SignUp1
String? email;
String? password;

// When the user registers an account
void registerAccount(String enteredEmail, String enteredPassword) {
  email = enteredEmail;
  password = enteredPassword;
}

// In SignUp2 or SignUp3
Map<String, dynamic> profileData = {};

// When the user fills out the profile creation form
void updateProfileData(Map<String, dynamic> newData) {
  profileData.addAll(newData);
}

// When the user submits the profile creation form
Future<void> createAccountAndProfile(BuildContext context) async {
  // Make sure we have both account info and profile info
  if (email != null && password != null && profileData.isNotEmpty) {
    // First, register the account
    final accountResponse = await http.post(
      Uri.parse('https://nebta.onrender.com/api/Account'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (accountResponse.statusCode == 200) {
      // Account registered successfully, parse the account ID
      final accountId = jsonDecode(accountResponse.body)['accountId'];

      // Then, create the profile
      final profileResponse = await http.post(
        Uri.parse('https://nebta.onrender.com/api/Account/$accountId'),
        body: jsonEncode(profileData),
        headers: {'Content-Type': 'application/json'},
      );

      if (profileResponse.statusCode == 200) {
        // Profile created successfully
        // Proceed to the next step (if any) or navigate to the main screen
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else {
        // Handle profile creation failure
        print('Profile creation failed: ${profileResponse.body}');
        // Show error message to the user
      }
    } else {
      // Handle account registration failure
      print('Account registration failed: ${accountResponse.body}');
      // Show error message to the user
    }
  } else {
    // Handle missing account or profile info
    print('Missing account or profile information');
    // Show error message to the user
  }
}


class ProfileData {
  final String fullName;
  final String relative;
  final String gender;
  final String dateOfBirth;
  final String height;
  final String weight;

  ProfileData({
    required this.fullName,
    required this.relative,
    required this.gender,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
  });
}