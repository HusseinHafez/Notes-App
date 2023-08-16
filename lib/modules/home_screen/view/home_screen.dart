import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/components/my_drawer.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/modules/home_screen/controller/home_cubit.dart';
import 'package:notes_app/modules/home_screen/view/widgets/add_note_modal_sheet.dart';
import 'package:notes_app/modules/home_screen/view/widgets/notes_list_view.dart';
import '../../../core/components/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final controller=servicesLocator<HomeCubit>();
        return SafeArea(
          child: Scaffold(
            drawer: const MyDrawer(),
            floatingActionButton: FloatingActionButton(
              shape: const CircleBorder(),
              onPressed: () {
                controller.titleController.clear();
                controller.contentController.clear();
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24)),
                  context: context,
                  builder: (context) => const AddNoteModalSheet(),
                );
              },
              backgroundColor: Colors.white.withOpacity(.4),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
            body:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Column(
                children: [CustomAppBar(
                  isHome: true,
                  onPressed: () {
                  
                },), const Expanded(child: NotesListView())],
              ),
            ),
          ),
        );
      },
    );
  }
}
