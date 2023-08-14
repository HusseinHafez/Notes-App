import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/providers/notes_controller/notes_cubit.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  static EditNoteCubit get()=>BlocProvider.of(NotesCubit.navigatorKey.currentContext!);
    GlobalKey<FormState> formKey= GlobalKey<FormState>();
  TextEditingController titleController=TextEditingController();
  TextEditingController contentController=TextEditingController();
}
