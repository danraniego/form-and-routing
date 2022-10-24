import 'package:flutter/material.dart';
import 'package:input_and_form/models/user.dart';

class UserPage extends StatelessWidget {

  final User user;

  const UserPage({
    required this.user,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name ?? "No Name"),
      ),
    );
  }
}
