import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/core/components/app_button.dart';
import 'package:notes_app/core/components/app_textfield.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/modules/home_screen/controller/home_cubit.dart';

class AddNoteModalSheet extends StatelessWidget {
  const AddNoteModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final controller = servicesLocator<HomeCubit>();
        return SizedBox(
          width: AppConstants.width,
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  AppTextField(
                    controller: controller.titleController,
                    autovalidateMode: controller.autovalidateMode,
                    hint: "Title",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  AppTextField(
                    controller: controller.contentController,
                    autovalidateMode: controller.autovalidateMode,
                    maxlines: 5,
                    hint: "Content",
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  AppButton(
                    text: 'Add Note',
                    onPressed: () {
                      controller.addNotes();
                    },
                    backgroundColor: Colors.cyan.shade900,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
