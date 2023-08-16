
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/modules/edit_note_screen/view/edit_note_screen.dart';
import 'package:notes_app/modules/home_screen/controller/home_cubit.dart';

import 'notes_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final controller = servicesLocator<HomeCubit>();
        return ValueListenableBuilder(
          valueListenable: controller.notesBox.listenable(),
          builder: (context, box, child) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                NoteModel note = box.getAt(index);
                return NotesItem(
                  title: note.title,
                  content: note.content,
                  color: note.color,
                  onPressed: () {
                    box.deleteAt(index);
                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditNoteScreen(
                          model: note,
                          index: index,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
