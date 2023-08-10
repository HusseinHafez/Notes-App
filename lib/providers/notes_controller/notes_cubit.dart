import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

 static GlobalKey<NavigatorState> navigatorKey =GlobalKey<NavigatorState>();

  static NotesCubit get()=>BlocProvider.of<NotesCubit>(navigatorKey.currentContext!);
}
