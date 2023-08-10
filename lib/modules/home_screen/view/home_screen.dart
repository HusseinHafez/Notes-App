import 'package:flutter/material.dart';
import 'package:notes_app/modules/home_screen/view/widgets/notes_list_view.dart';
import 'widgets/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            children: [
              CustomAppBar(),
              Expanded(
                child: NotesListView()
              )
            ],
          ),
        ),
      ),
    );
  }
}

