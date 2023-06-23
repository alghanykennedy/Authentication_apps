import 'package:authentication_apps/modules/users/application/controllers/user_controller.dart';
import 'package:authentication_apps/modules/users/presentation/home/widgets/user_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          TextButton(
            onPressed: () async {
              userController.logout();
            },
            child: const Text(
              'logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: UserList(),
    );
  }
}
