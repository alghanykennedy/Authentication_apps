// ignore_for_file: must_be_immutable

import 'package:authentication_apps/modules/authentication/application/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  AuthController authController = Get.find<AuthController>();

  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;

  TextFieldWidget(this.textEditingController, this.hintText, this.labelText,
      this.prefixIcon, this.suffixIcon,
      {super.key, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: () {
                    authController.togglePasswordVisibility();
                  },
                  icon: Icon(
                    suffixIcon,
                  ),
                )
              : null,
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
