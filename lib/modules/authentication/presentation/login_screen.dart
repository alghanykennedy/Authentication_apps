import 'package:authentication_apps/core/constants/routes.dart';
import 'package:authentication_apps/modules/authentication/application/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication/widgets/submit_button_widget.dart';
import 'authentication/widgets/textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login to your account",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/imgs/background.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                              textEditingController:
                                  authController.loginEmailController,
                              hintText: 'name@example.com',
                              labelText: 'email',
                              prefixIcon: Icons.mail,
                              suffixIcon: null,
                              emailValidator: (value) {
                                return authController.validateEmail(value);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFieldWidget(
                              textEditingController:
                                  authController.loginPasswordController,
                              hintText: 'password',
                              labelText: 'password',
                              prefixIcon: Icons.lock,
                              suffixIcon: authController.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              obscureText:
                                  authController.isPasswordVisible.value,
                              passwordValidator: (value) {
                                return authController.validatePassword(
                                    value, 6);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SubmitButton(
                        onPressed: () => authController.loginWithEmail(),
                        title: 'Login',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have an account? "),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(RouteNames.signupScreen);
                          },
                          child: const Text(
                            "Signup",
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
