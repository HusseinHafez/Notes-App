import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/modules/todo_screen/controller/todo_cubit.dart';
import 'package:notes_app/modules/todo_screen/view/widgets/add_todo_modal_sheet.dart';
import 'package:notes_app/modules/todo_screen/view/widgets/todo_list_view.dart';

import '../../../core/components/custom_appbar.dart';
import '../../../core/components/my_drawer.dart';
import '../../../core/utils/app_sevice_locator.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        final controller = servicesLocator<TodoCubit>();
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              drawer: const MyDrawer(),
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  controller.titleController.clear();
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    context: context,
                    builder: (context) => const AddTodoModalSheet(),
                  );
                },
                backgroundColor: Colors.white.withOpacity(.4),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              body: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                child: Column(
                  children: [
                    CustomAppBar(
                      isHome: true,
                      title: "Todo",
                      onPressed: () {},
                    ),
                    const Expanded(child: TodoListView())
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
