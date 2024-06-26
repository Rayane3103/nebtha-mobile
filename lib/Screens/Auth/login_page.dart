import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Components/customNavbar.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? throwShotAway = false;
  bool isLoading = false;
  String? errorMessage;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> Login() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    final Map<String, dynamic> requestBody = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    final String requestBodyJson = json.encode(requestBody);

    try {
      final response = await http.post(
        Uri.parse('https://nebta.onrender.com/api/Account/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: requestBodyJson,
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        final profileId = responseBody['data']['profile'][0];
        final token = responseBody['data']['token'];

        final profileResponse = await FetchProfile(profileId, token);

        if (profileResponse != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyMainWidget(profileData: profileResponse),
            ),
          );
        } else {
          setState(() {
            errorMessage = 'Failed to fetch profile';
          });
        }
      } else {
        setState(() {
          errorMessage = 'Failed to login: ${json.decode(response.body)['message']}';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error during login: $error';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

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
        return json.decode(response.body);
      } else {
        setState(() {
          errorMessage = 'Fetch profile error: ${json.decode(response.body)['message']}';
        });
        return null;
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error fetching profile: $error';
      });
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Row(
          children: [
            Text('   Connecter votre compte Nebtha', style: TextStyle(color: Colors.white, fontSize: 20),)
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
              child: ListView(
                children: [
                  const SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: const [BoxShadow(blurRadius: 1)]
                    ),
                    width: 360,
                    height: 580,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          const SizedBox(height: 20,),
                          const Center(
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 1.5,
                                decorationColor: primaryColor,
                                color: primaryColor,
                                fontSize: 36,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          CustomTextField(
                            labelText: 'E-mail',
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          CustomTextField(
                            labelText: 'Mot de pass',
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            controller: _passwordController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: throwShotAway,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        throwShotAway = newValue!;
                                      });
                                    },
                                  ),
                                  const Text('Remember Me',),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Forgot Password?', style: TextStyle(color: primaryColor),),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          if (errorMessage != null) ...[
                            Text(
                              errorMessage!,
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10,),
                          ],
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () async {
                              await Login();
                            },
                            child: isLoading
                              ? const CircularProgressIndicator(color: Colors.white,)
                              : const Text('Se Connecter', style: TextStyle(color: Colors.white),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(context, '/signup1', (route) => false);
                                },
                                child: const Text("N'avez pas du compte? Inscrire!", style: TextStyle(color: primaryColor),),
                              ),
                            ],
                          ),
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
