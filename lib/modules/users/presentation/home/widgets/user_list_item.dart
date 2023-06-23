import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  final String profilePictureUrl;
  final String name;
  final String email;

  const UserListItem(
      {super.key,
      required this.profilePictureUrl,
      required this.name,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profilePictureUrl),
      ),
      title: Text(name),
      subtitle: Text(email),
    );
  }
}
