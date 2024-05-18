import 'package:flutter/material.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/Auth/signup_page2.dart';

class SignUp1 extends StatefulWidget {
  const SignUp1({super.key});

  @override
  State<SignUp1> createState() => _SignUp1State();
}

class _SignUp1State extends State<SignUp1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool? throwShotAway = false;

  void goToSignUp2(String email, String password, String phoneNumber) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SignUp2(
            phoneNumber: phoneNumber,
            email: email,
            password: password,
          ),
        ),
      );
    }
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
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
                      Navigator.popAndPushNamed(context, '/');
                    },
                    iconSize: 30,
                    color: primaryColor,
                    icon: const Icon(Icons.chevron_left_rounded),
                  ),
                ),
              ),
            ),
            const Text(
              '   Créer votre compte Nebtha',
              style: TextStyle(color: Colors.white,fontSize: 20),
            ),
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
              child: Form(
                key: _formKey,
                child: ListView(
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
                        child: ListView(
                          children: [
                            const SizedBox(height: 20),
                            CustomTextField(
                              labelText: 'E-mail',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: emailValidator,
                            ),
                            CustomTextField(
                              labelText: 'Numero de téléphone',
                              keyboardType: TextInputType.phone,
                              controller: phoneController,
                            ),
                            CustomTextField(
                              labelText: 'Mot de passe',
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              validator: passwordValidator,
                            ),
                            CustomTextField(
                              labelText: 'Confirmer le mot de passe',
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              controller: confirmPasswordController,
                              validator: confirmPasswordValidator,
                            ),
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
                                const Text('Accepter tous ns'),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'conditions',
                                    style: TextStyle(color: primaryColor),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  goToSignUp2(
                                    emailController.text,
                                    passwordController.text,
                                    phoneController.text,
                                  );
                                }
                              },
                              child: const Text(
                                'Suivant',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
