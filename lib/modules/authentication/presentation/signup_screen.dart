import 'package:authentication_apps/core/constants/routes.dart';
import 'package:authentication_apps/modules/authentication/application/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication/widgets/submit_button_widget.dart';
import 'authentication/widgets/textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create an acoount, it's free",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(authController.nameController,
                                'Name Example', 'Name', Icons.person, null),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                                authController.signupEmailController,
                                'name@example.com',
                                'Email',
                                Icons.mail,
                                null),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                              authController.signupPasswordController,
                              'password',
                              'Password',
                              Icons.lock,
                              authController.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              obscureText:
                                  authController.isPasswordVisible.value,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SubmitButton(
                        onPressed: () => authController.signupWithEmail(),
                        title: 'Signup',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account? "),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(RouteNames.loginScreen);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}