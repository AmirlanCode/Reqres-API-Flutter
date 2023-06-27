import 'package:flutter/material.dart';

class UserListTileWidget extends StatelessWidget {
  const UserListTileWidget({
    super.key,
    required this.avatarUrl,
    required this.email,
    required this.firstName,
  });

  final String avatarUrl;
  final String email;
  final String firstName;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          leading: Image.network(avatarUrl),
          trailing: Text(email),
          title: Text(firstName),
        ),
      ),
    );
  }
}
