import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/components/app_textfield.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/modules/home_screen/view/widgets/custom_appbar.dart';

import '../controller/edit_note_cubit.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<EditNoteCubit>(),
      child: BlocBuilder<EditNoteCubit, EditNoteState>(
        builder: (context, state) {
          final controller=servicesLocator<EditNoteCubit>();
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Form(
                child: Column(
                  children: [
                    const CustomAppBar(
                      title: "Edit Note",
                      icon: Icons.check,
                    ),
                    AppTextField(controller: controller.titleController,hint: "Title",),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(controller: controller.contentController,hint: "Content",maxlines: 5,),
                  ],
                ),
              ),
            )),
          );
        },
      ),
    );
  }
}
