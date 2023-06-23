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
      final LoginParams loginParams = LoginParams(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text,
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
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Error'),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(error.toString())],
          );
        },
      );
    }
  }

  Future<void> signupWithEmail() async {
    try {
      final SignupParams signupParams = SignupParams(
        name: nameController.text,
        email: signupEmailController.text.trim(),
        password: signupPasswordController.text,
      );
      final result = await signupUseCase(signupParams);
      if (result.code == 0) {
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
}
