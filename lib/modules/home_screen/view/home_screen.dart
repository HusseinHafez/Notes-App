import 'package:flutter/material.dart';
import 'package:notes_app/modules/home_screen/view/widgets/add_note_modal_sheet.dart';
import 'package:notes_app/modules/home_screen/view/widgets/notes_list_view.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24)
              ),
              context: context, builder:(context) => const AddNoteModalSheet(), );
          },
          backgroundColor: Colors.white.withOpacity(.4),
          child: const Icon(Icons.add,color: Colors.black,),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            children: [CustomAppBar(), Expanded(child: NotesListView())],
          ),
        ),
      ),
    );
  }
}
