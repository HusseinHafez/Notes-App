import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/components/app_textfield.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/core/components/custom_appbar.dart';

import '../controller/edit_note_cubit.dart';

class EditNoteScreen extends StatelessWidget {
  final NoteModel model;
  final int index;
  const EditNoteScreen({super.key, required this.model, required this.index,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<EditNoteCubit>(),
      child: BlocBuilder<EditNoteCubit, EditNoteState>(
        builder: (context, state) {
          final controller = servicesLocator<EditNoteCubit>();
          controller.titleController.text=model.title;
          controller.contentController.text=model.content;
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomAppBar(
                      title: "Edit Note",
                      icon: Icons.check,
                      onPressed: () {
                        if(controller.formKey.currentState!.validate()){
                          Hive.box<NoteModel>(AppConstants.noteBOx).putAt(index, NoteModel(title: controller.titleController.text, content: controller.contentController.text, date:DateTime.now().toString(), color: Random().nextInt(2),),);
                        }
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    AppTextField(
                      controller: controller.titleController,
                      hint: "Title",
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppTextField(
                      controller: controller.contentController,
                      hint: "Content",
                      maxlines: 5,
                    ),
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
