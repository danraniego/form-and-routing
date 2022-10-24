import 'package:flutter/material.dart';
import 'package:input_and_form/pages/add_user.dart';
import 'package:input_and_form/pages/user_page.dart';

class ListSections extends StatefulWidget {
  const ListSections({Key? key}) : super(key: key);

  @override
  State<ListSections> createState() => _ListSectionsState();
}

class _ListSectionsState extends State<ListSections> {

  List users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List'),
      ),
      body: ListView(
        children: [
          ...users.map((user) => Dismissible(
              key: Key(user.name),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.redAccent,
              ),
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.address),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserPage(user: user)
                      )
                  );
                },
              )
          )).toList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {;

          var newUser = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddUser())
          );

          if (newUser != null) {
            setState(() {
              users.add(newUser);
            });
          }
        },
      ),
    );
  }
}
