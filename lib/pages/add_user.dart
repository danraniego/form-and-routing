import 'package:flutter/material.dart';

import '../models/user.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  List sections = ['3R1', '3R2', '3R3'];
  String? selectedSection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Name",
                labelText: "Name"
              ),
              validator: (value) {
                return value == null || value.isEmpty  ? 'Pag enter ug pangalan' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: addressController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: "Address",
                labelText: "Address",
              ),
              minLines: 1,
              maxLines: 3,
              validator: (value) {
                return value == null || value.isEmpty  ? 'Pag enter ug address' : null;
              },
            ),
            const SizedBox(height: 20),
            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonFormField(
                  items: [
                    ...sections.map((section) => DropdownMenuItem(
                      value: section,
                      child: Text(section),
                    ))
                  ],
                  value: selectedSection,
                  decoration: const InputDecoration(
                    hintText: "Section",
                    labelText: "Section"
                  ),
                  validator: (value) {
                    return value == null ? 'Pag pili ug section' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedSection = value as String?;
                    });
                  }
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      User newUser = User(
                          name: nameController.text,
                          address: addressController.text,
                          section: selectedSection
                      );

                      Navigator.pop(context, newUser);
                    }
                  },
                  child: const Text('Save')
              ),
            )
          ],
        ),
      )
    );
  }
}
