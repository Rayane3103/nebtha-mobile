
import 'package:flutter/material.dart';
import 'package:nebtha/Components/auth/customfield.dart';
import 'package:nebtha/Components/auth/date_picker.dart';
import 'package:nebtha/Components/auth/drop_menu.dart';
import 'package:nebtha/Constants/constants.dart';
import 'package:nebtha/Constants/design.dart';
import 'package:nebtha/Screens/Auth/signup_page3.dart';
import 'package:nebtha/Services/auth_account.dart';

class SignUp2 extends StatefulWidget {
  final String email;
  final String password;

  const SignUp2({super.key, required this.email, required this.password});

  @override
  State<SignUp2> createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2> {

 void goToSignUp3() {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => SignUp3(
        email: widget.email,
        password: widget.password,
        fullName: fullNameController.text,
        relativeValue: relativeValue ?? '',
        genderValue: genderValue ?? '',
        dateOfBirthValue: dateOfBirthValue ?? '',
        height: heightController.text,
        weight: weightController.text,
      ),
    ),
  );
}



  TextEditingController fullNameController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  bool? throwShotAway = false;
  String? relativeValue;
  String? genderValue;
  String? dateOfBirthValue;





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
                      Navigator.popAndPushNamed(context, '/signup1');
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
              style: TextStyle(color: Colors.white),
            )
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
                            labelText: 'FullName',
                            keyboardType: TextInputType.text,
                            controller: fullNameController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: 160,
                                  child: Dropyy(
                                    hintText: 'Relative',
                                    dropItems: droppyItems1,
                                    onChanged: (value) {
                                      setState(() {
                                        relativeValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: 160,
                                  child: Dropyy(
                                    hintText: 'Gender',
                                    dropItems: droppyItems2,
                                    onChanged: (value) {
                                      setState(() {
                                        genderValue = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DatePickerr(
                            onChanged: (value) {
                              setState(() {
                                dateOfBirthValue = value;
                              });
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: 160,
                                  child: CustomTextField(
                                    labelText: 'Height (cm)',
                                    keyboardType: TextInputType.number,
                                    controller: heightController,
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: 160,
                                  child: CustomTextField(
                                    labelText: 'Weight (Kg)',
                                    keyboardType: TextInputType.number,
                                    controller: weightController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: throwShotAway,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    throwShotAway = newValue;
                                  });
                                },
                              ),
                              const Text('Accepter tous les '),
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
                            style:
                                ElevatedButton.styleFrom(backgroundColor: primaryColor),
                            onPressed: () {
                              goToSignUp3();
                            print('Your email is: ${widget.email}');
                            print('Your password is: ${widget.password}');
                            print('Your full name is: ${fullNameController.text}');
                            print('Your relative value is: $relativeValue');
                            print('Your gender value is: $genderValue');
                            print('Your date of birth value is: $dateOfBirthValue');
                            print('Your height is: ${heightController.text}');
                            print('Your weight is: ${weightController.text}');

                              
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
        ],
      ),
    );
  }
}