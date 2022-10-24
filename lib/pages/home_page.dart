import 'package:flutter/material.dart';
import 'package:input_and_form/models/student.dart';
import 'package:input_and_form/pages/add_student.dart';
import 'package:input_and_form/pages/student_details_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List students = <Student>[
    Student(
      name: 'Dan Walker',
      emailAddress: 'danraniego@gmail.com',
      phoneNumber: '+639750492685',
      birthDate: '03/21/1995',
      age: 27,
      section: '3R1',
      course: 'BSIT',
      gender: 'Male',
      facebookUrl: 'https://facebook.com'
    )
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity #4'),
      ),
      body: students.isEmpty ? const Center(child: Text('No Data')) : ListView(
        children: [
          ...students.map((student) => Card(
            child: Dismissible(
              key: Key(student.name),
              background: Container(
                color: Colors.redAccent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text('DELETE'),
                    )
                  ],
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  students.remove(student);
                });
              },
              child: ExpansionTile(
                leading: const Icon(Icons.account_circle_rounded, size: 40),
                title: Text(student.name),
                childrenPadding: const EdgeInsets.all(20),
                children: [
                  StudentDetailsItem(title: 'Email Address', value: student.emailAddress),
                  StudentDetailsItem(title: 'Phone Number', value: student.phoneNumber),
                  StudentDetailsItem(title: 'Birthday', value: student.birthDate),
                  StudentDetailsItem(title: 'Age', value: student.age.toString()),
                  StudentDetailsItem(title: 'Gender', value: student.gender),
                  StudentDetailsItem(title: 'Course', value: student.course),
                  StudentDetailsItem(title: 'Section', value: student.section),
                  StudentDetailsItem(title: 'Facebook', value: student.facebookUrl)
                ],
              ),
            ),
          )).toList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          var result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddStudent())
          );

          if (result != null) {
            setState(() {
              students.add(result);
            });
          }
        }
      )
    );
  }
}
