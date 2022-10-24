import 'package:flutter/material.dart';
import 'package:input_and_form/pages/add_user.dart';
import 'package:input_and_form/pages/list_section.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    home: const ListSections(),
  ));
}
