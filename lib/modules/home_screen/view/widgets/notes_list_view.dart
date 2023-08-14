import 'package:flutter/material.dart';
import 'package:notes_app/modules/edit_note_screen/view/edit_note_screen.dart';

import 'notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => NotesItem(
        title: 'Title',
        content: 'Write your notes here',
        onPressed: () {},
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EditNoteScreen(),
            ),
          );
        },
      ),
      itemCount: 10,
    );
  }
}
