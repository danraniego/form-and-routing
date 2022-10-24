import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:input_and_form/models/student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {

  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController sectionController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  String? selectedGender;

  List<String> genders = ["Male", "Female", "Secret"];

  Student addStudent() {
    Student newStudent = Student(
      name: nameController.text,
      emailAddress: emailAddress.text,
      phoneNumber: phoneNumber.text,
      section: sectionController.text,
      course: courseController.text,
      birthDate: birthDateController.text,
      age: int.parse(ageController.text),
      gender: selectedGender,
      facebookUrl: facebookController.text
    );

    return newStudent;
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;



    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
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
                hintText: 'Name',
                labelText: 'Name',
              ),
              validator: (value) {
                return value == null || value.isEmpty ? 'Please enter name' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: emailAddress,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email Address',
                labelText: 'Email Address',
              ),
              validator: (value) {
                return value == null || value.isEmpty || !EmailValidator.validate(value) ? 'Please enter email address' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: phoneNumber,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                labelText: 'Phone Number',
              ),
              validator: (value) {
                return value == null || value.isEmpty ? 'Please enter phone number' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: birthDateController,
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                hintText: 'Birthdate',
                labelText: 'Birthdate',
              ),
              validator: (value) {
                return value == null || value.isEmpty ? 'Please enter birthdate' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Age',
                labelText: 'Age',
              ),
              validator: (value) {
                return value == null || value.isEmpty ? 'Please enter age' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: sectionController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Section',
                labelText: 'Section',
              ),
              validator: (value) {
                return value == null || value.isEmpty ? 'Please enter section' : null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: courseController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'Course',
                labelText: 'Course',
              ),
              validator: (value) {
                return value == null || value.isEmpty ? 'Please enter course' : null;
              },
            ),
            const SizedBox(height: 20),
            ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonFormField(
                  items: [
                    ...genders.map((gender) => DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    ))
                  ],
                  value: selectedGender,
                  decoration: const InputDecoration(
                      hintText: 'Select Gender',
                      labelText: 'Select Gender'
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty ? 'Please select gender' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  }
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: facebookController,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                hintText: 'Facebook',
                labelText: 'Facebook',
              ),
              validator: (value) {
                return value == null || value.isEmpty || Uri.parse(value).hasAbsolutePath == false ? 'Please enter valid facebook url' : null;
              },
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 40,
              width: size.width,
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Student newStudent = addStudent();
                    Navigator.pop(context, newStudent);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
