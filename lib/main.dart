import 'package:authentication_apps/modules/authentication/application/bindings/auth_binding.dart';
import 'package:authentication_apps/modules/authentication/presentation/login_screen.dart';
import 'package:authentication_apps/modules/authentication/presentation/signup_screen.dart';
import 'package:authentication_apps/modules/users/application/bindings/user_binding.dart';
import 'package:authentication_apps/modules/users/presentation/home/home_screen.dart';
import 'package:authentication_apps/modules/welcome/application/bindings/welcome_binding.dart';
import 'package:authentication_apps/modules/welcome/presentation/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/constants/routes.dart';

main() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.welcomeScreen,
      getPages: [
        GetPage(
          name: RouteNames.welcomeScreen,
          page: () => const WelcomeScreen(),
          binding: WelcomeBindings(),
        ),
        GetPage(
          name: RouteNames.loginScreen,
          page: () => const LoginScreen(),
          binding: AuthBindings(),
        ),
        GetPage(
          name: RouteNames.signupScreen,
          page: () => const SignupScreen(),
          binding: AuthBindings(),
        ),
        GetPage(
          name: RouteNames.homeScreen,
          page: () => HomeScreen(),
          binding: UserBindings(),
        ),
      ],
    ),
  );
}
