import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/todo_screen/controller/todo_cubit.dart';

import '../../../../core/components/app_button.dart';
import '../../../../core/components/app_textfield.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_sevice_locator.dart';

class AddTodoModalSheet extends StatelessWidget {
  const AddTodoModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
   return  BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        final controller = servicesLocator<TodoCubit>();
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
                    height: 100,
                  ),
                  AppButton(
                    text: 'Add Todo',
                    onPressed: () {
                      controller.addTodo();
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