import 'package:flutter/material.dart';

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
                  ),
                  itemCount: 10,
                );
  }
}