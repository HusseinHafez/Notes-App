import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/model/todo_model.dart';
import 'package:notes_app/modules/todo_screen/controller/todo_cubit.dart';

import '../../../../core/utils/app_sevice_locator.dart';
import '../../../edit_todo_screen/view/edit_todo_screen.dart';

class TodoListView extends StatelessWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        final controller = servicesLocator<TodoCubit>();
        return ValueListenableBuilder(
          valueListenable: controller.todosBox.listenable(),
          builder: (context, box, child) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                TodoModel todo = box.getAt(index);
                return ListTile(
                  leading: Checkbox(
                    value: todo.isDone,
                    onChanged: (value) =>
                        controller.todoCheckBoxOnChanged(value,index),
                        checkColor: Colors.grey,
                  ),
                  title: Text(todo.title!,style: TextStyle(
                    color: todo.isDone!?Colors.grey:Colors.white,
                    decoration: todo.isDone!?TextDecoration.lineThrough:TextDecoration.none,
                    fontSize: 20,
                    fontWeight: todo.isDone!? FontWeight.w300:FontWeight.w500,
                  ),),
                  trailing: IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.trash,
                      color: Colors.red,
                    ),
                    onPressed: () {
                       box.deleteAt(index);
                    },
                  ),
                                    onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTodoScreen(
                          model: todo,
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
