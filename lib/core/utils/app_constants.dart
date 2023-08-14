import 'package:flutter/material.dart';
import 'package:notes_app/providers/notes_controller/notes_cubit.dart';

class AppConstants{

  static double width=MediaQuery.of(NotesCubit.navigatorKey.currentContext!).size.width;
  static double height=MediaQuery.of(NotesCubit.navigatorKey.currentContext!).size.height;
}