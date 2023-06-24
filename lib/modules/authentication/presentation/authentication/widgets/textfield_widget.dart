import 'package:authentication_apps/modules/authentication/application/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String labelText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? nameValidator;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;

  const TextFieldWidget({
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
    required this.prefixIcon,
    required this.suffixIcon,
    this.obscureText = false,
    this.nameValidator,
    this.emailValidator,
    this.passwordValidator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
        return TextFormField(
          controller: textEditingController,
          obscureText: obscureText,
          onChanged: (value) {
            if (labelText == 'email') {
              authController.updateEmailValidation(value);
            } else if (labelText == 'name') {
              authController.updateNameValidation(value);
            } else {
              authController.updatePasswordValidation(value);
            }
          },
          onFieldSubmitted: (value) {
            if (labelText == 'email') {
              authController.updateEmailValidation(value);
            } else if (labelText == 'name') {
              authController.updateNameValidation(value);
            } else {
              authController.updatePasswordValidation(value);
            }
          },
          validator: (value) {
            if (labelText == 'email') {
              return emailValidator!(value);
            } else if (labelText == 'name') {
              return nameValidator!(value);
            } else {
              return passwordValidator!(value);
            }
          },
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: () {
                      authController.togglePasswordVisibility();
                    },
                    icon: Icon(suffixIcon),
                  )
                : null,
            alignLabelWithHint: true,
            errorText: labelText == 'password'
                ? authController.isPasswordValidationEnable
                    ? passwordValidator != null
                        ? passwordValidator!(textEditingController.text)
                        : null
                    : null
                : labelText == 'email'
                    ? authController.isEmailValidationEnable
                        ? emailValidator != null
                            ? emailValidator!(textEditingController.text)
                            : null
                        : null
                    : labelText == 'name'
                        ? authController.isNameValidationEnable
                            ? nameValidator != null
                                ? nameValidator!(textEditingController.text)
                                : null
                            : null
                        : null,
          ),
        );
      },
    );
  }
}
