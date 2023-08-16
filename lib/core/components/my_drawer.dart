import 'package:flutter/material.dart';
import 'package:notes_app/modules/home_screen/view/home_screen.dart';
import 'package:notes_app/modules/todo_screen/view/todo_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            const Divider(
              color: Colors.deepOrange,
              thickness: 1,
            ),
            ListTile(
              title: const Text('Todo'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodoScreen(),
                  ),
                );
              },
            ),
             ListTile(
              title: const Text('Notes'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
