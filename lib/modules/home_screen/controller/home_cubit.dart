import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/providers/notes_controller/notes_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  //static HomeCubit get()=>BlocProvider.of<HomeCubit>(NotesCubit.navigatorKey.currentContext!);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  Box  notesBox=  Hive.box<NoteModel>(AppConstants.noteBOx);
  addNotes() async {
    if (formKey.currentState!.validate()) {
      emit(AddNoteLoadingState());
      try {
      
        NoteModel note = NoteModel(
            title: titleController.text,
            content: contentController.text,
            date: DateTime.now().toString(),
            color: Random().nextInt(2) + 1);
        await notesBox.add(note);
      
        Navigator.pop(NotesCubit.navigatorKey.currentContext!);
        emit(AddNoteSucessState());
      } catch (e) {
        debugPrint(e.toString());
        emit(AddNoteFailureState());
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
