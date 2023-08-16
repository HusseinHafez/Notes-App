import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/components/app_textfield.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/core/components/custom_appbar.dart';
import 'package:notes_app/model/todo_model.dart';
import 'package:notes_app/modules/edit_todo_screen/controller/edit_todo_cubit.dart';

class EditTodoScreen extends StatelessWidget {
  final TodoModel model;
  final int index;
  const EditTodoScreen({
    super.key,
    required this.model,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => servicesLocator<EditTodoCubit>(),
      child: BlocBuilder<EditTodoCubit, EditTodoState>(
        builder: (context, state) {
          final controller = servicesLocator<EditTodoCubit>();
          controller.titleController.text = model.title!;
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    CustomAppBar(
                      title: "Edit Todo",
                      icon: Icons.check,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          Hive.box<TodoModel>(AppConstants.todoBox).putAt(
                            index,
                            TodoModel(
                              title: controller.titleController.text,
                              isDone: model.isDone,
                            ),
                          );
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
