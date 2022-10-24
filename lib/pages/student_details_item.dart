import 'package:flutter/material.dart';

class StudentDetailsItem extends StatelessWidget {

  final String title;
  final String value;

  const StudentDetailsItem({
    required this.title,
    required this.value,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(width: 5),
          const Text(':'),
          const SizedBox(width: 5),
          Expanded(
            child: Text(value),
          )
        ],
      ),
    );
  }
}
