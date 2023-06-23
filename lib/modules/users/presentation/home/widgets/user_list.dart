import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../application/controllers/user_controller.dart';
import '../../../domain/entities/user_response_model.dart';
import 'user_list_item.dart';

class UserList extends StatelessWidget {
  final UserController _userController = Get.find<UserController>();

  UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, UserData>.separated(
      pagingController: _userController.pagingController,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) {
          return UserListItem(
            profilePictureUrl: item.profilePicture,
            name: item.name,
            email: item.email,
          );
        },
        firstPageProgressIndicatorBuilder: (_) => const Center(
          child: Text("Loading ..."),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
