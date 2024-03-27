import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/FirebaseAuthController.dart';
import '../widegts/formfield.dart';
import 'SignInScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signupController = Get.put(FirebaseAuthController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  /* Text Validate Variables */
  bool isEmailValid = false;
  var emailValidationError = '';
  bool isPasswordValid = false;
  var passwordValidationError = '';
  bool isConfirmPasswordValid = false;
  var confirmPasswordValidationError = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            const Center(
              child: Text(
                'Sign Up Screen',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF22113C),
                  fontSize: 34,
                  // height: 0.09,
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Center(
              child: Container(
                height: Get.height * 0.55,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      CustomFormTextFields(
                        controller: emailController,
                        label: 'E-mail',
                      ),
                      isEmailValid == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${emailValidationError}',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: Get.height * 0.03),
                      CustomFormTextFields(
                        controller: passController,
                        isPassword: true,
                        label: 'Password',
                      ),
                      isPasswordValid == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${passwordValidationError}',
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      CustomFormTextFields(
                        controller: confirmPasswordController,
                        isPassword: true,
                        label: 'Confirm Password',
                        // validationMessage:
                        //     'Пожалуйста, введите свое Подтвердите новый пароль',
                      ),
                      isConfirmPasswordValid == true
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                confirmPasswordValidationError,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: Get.height * 0.05),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEmailValid = false;
                            isPasswordValid = false;
                            isConfirmPasswordValid = false;
                          });
                          final emailRegex =
                              RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');
                          if (_formKey.currentState!.validate()) {
                            if (emailController.text == "") {
                              setState(() {
                                isEmailValid = true;
                                emailValidationError = 'E-mail is required';
                              });
                            } else if (!emailRegex
                                .hasMatch(emailController.text)) {
                              setState(() {
                                isEmailValid = true;
                                emailValidationError = 'Invalid E-mail ';
                              });
                            } else if (passController.text == "") {
                              setState(() {
                                isPasswordValid = true;
                                passwordValidationError =
                                    'Password field is required ';
                              });
                            } else if (confirmPasswordController.text == "") {
                              setState(() {
                                isConfirmPasswordValid = true;
                                confirmPasswordValidationError =
                                    "Confirm Password Field is Required";
                              });
                            } else if (passController.text !=
                                confirmPasswordController.text) {
                              setState(() {
                                isConfirmPasswordValid = true;
                                confirmPasswordValidationError = "Passwords Not Match";
                              });
                            } else {
                              signupController.signUp(
                                emailController.text,
                                passController.text,
                              );
                              print('Click Login');
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF22113C),
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 1, color: Color(0xFF544370)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: const BorderSide(
                            width: 1,
                            color: Color(0xFF544370),
                          ),
                        ),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            TextButton(
                onPressed: () {
                  Get.to(() => SignInScreen());
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Color(0xFF22113C),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            SizedBox(height: Get.height * 0.02),
          ],
        ),
      ),
    );
  }
}
