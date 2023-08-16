import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../providers/notes_controller/notes_cubit.dart';
import '../../edit_note_screen/controller/edit_note_cubit.dart';

part 'edit_todo_state.dart';

class EditTodoCubit extends Cubit<EditTodoState> {
  EditTodoCubit() : super(EditTodoInitial());
 static EditNoteCubit get()=>BlocProvider.of(NotesCubit.navigatorKey.currentContext!);
    GlobalKey<FormState> formKey= GlobalKey<FormState>();
  TextEditingController titleController=TextEditingController();


}
