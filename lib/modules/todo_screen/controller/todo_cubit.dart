import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/model/todo_model.dart';

import '../../../core/utils/app_constants.dart';
import '../../../providers/notes_controller/notes_cubit.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool checkBoxValue = false;
  Box todosBox = Hive.box<TodoModel>(AppConstants.todoBox);
  addTodo() async {
    if (formKey.currentState!.validate()) {
      emit(AddTodoLoadingState());
      try {
        TodoModel todo =
            TodoModel(title: titleController.text, isDone: checkBoxValue);

        await todosBox.add(todo);

        Navigator.pop(NotesCubit.navigatorKey.currentContext!);
        emit(AddTodoSucessState());
      } catch (e) {
        debugPrint(e.toString());
        emit(AddTodoErrorState());
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }

  todoCheckBoxOnChanged(bool? value, int index) {
    emit(TodoInitial());
    checkBoxValue = value!;
    TodoModel todo = TodoModel(title: titleController.text, isDone: value);
    todosBox.putAt(index, todo);
    emit(ChangeCheckBoxValue());
  }
}
