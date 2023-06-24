import 'package:authentication_apps/modules/authentication/domain/params/signup_params.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/check_token_usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/logout_usecase.dart';
import 'package:authentication_apps/modules/authentication/domain/usecase/signup_usecase.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/routes.dart';
import '../../domain/params/login_params.dart';
import '../../domain/usecase/login_usecase.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final CheckTokenUsecase checkTokenUsecase;
  final LogoutUseCase logoutUseCase;

  bool isNameValidationEnable = false;
  bool isEmailValidationEnable = false;
  bool isPasswordValidationEnable = false;
  RxBool isPasswordVisible = true.obs;

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();

  AuthController({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.checkTokenUsecase,
    required this.logoutUseCase,
  });

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  Future<void> checkToken() async {
    final isTokenExist = await checkTokenUsecase(null);
    if (isTokenExist) {
      Get.offNamed(RouteNames.homeScreen);
    }
  }

  Future<void> loginWithEmail() async {
    try {
      final String email = loginEmailController.text.trim();
      final String password = loginPasswordController.text;

      if (email.isEmpty && password.isEmpty) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text(
                    'Email and password are required. Please input email and password correctly.'),
              ],
            );
          },
        );
        return;
      } else if (email.isEmpty) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Email is required. Please input email.'),
              ],
            );
          },
        );
        return;
      } else if (password.isEmpty) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Password is required. Please input password.'),
              ],
            );
          },
        );
        return;
      }

      final LoginParams loginParams = LoginParams(
        email: email,
        password: password,
      );
      final result = await loginUseCase(loginParams);
      if (result.code == 0) {
        loginEmailController.clear();
        loginPasswordController.clear();
        Get.offNamed(RouteNames.homeScreen);
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [
                Text(
                  result.message ?? '',
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Handle the error
    }
  }

  Future<void> signupWithEmail() async {
    try {
      final String name = nameController.text.trim();
      final String email = signupEmailController.text.trim();
      final String password = signupPasswordController.text;

      if (name.isEmpty) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Please input name.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      } else if (email.isEmpty) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Email is required. Please input email.'),
              ],
            );
          },
        );
        return;
      } else if (password.isEmpty) {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text('Password is required. Please input password.'),
              ],
            );
          },
        );
        return;
      }

      final SignupParams signupParams = SignupParams(
        name: name,
        email: email,
        password: password,
      );
      final result = await signupUseCase(signupParams);
      if (result.code == 0) {
        nameController.clear();
        signupEmailController.clear();
        signupPasswordController.clear();
        Get.offNamed(RouteNames.loginScreen);
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Error'),
              contentPadding: const EdgeInsets.all(20),
              children: [
                Text(
                  result.message ?? '',
                ),
              ],
            );
          },
        );
      }
    } on DioException catch (dioError) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('on DioError'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(dioError.response?.data.toString() ?? 'An error occurred.'),
            ],
          );
        },
      );
    } catch (error) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Errorz'),
            contentPadding: const EdgeInsets.all(20),
            children: [
              Text(error.toString()),
            ],
          );
        },
      );
    }
  }

  Future<void> logoutUser() async {
    await logoutUseCase(null);
    Get.offNamed(RouteNames.loginScreen);
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
    update();
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value, int minLength) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  void updateNameValidation(String value) {
    if (value.isEmpty) {
      isNameValidationEnable = true;
    } else {
      isNameValidationEnable = false;
    }
    update();
  }

  void updateEmailValidation(String value) {
    final bool isEmailValid = GetUtils.isEmail(value);
    isEmailValidationEnable = !isEmailValid;
    update();
  }

  void updatePasswordValidation(String value) {
    if (value.length < 6 || value.isEmpty) {
      isPasswordValidationEnable = true;
    } else {
      isPasswordValidationEnable = false;
    }
    update();
  }
}
