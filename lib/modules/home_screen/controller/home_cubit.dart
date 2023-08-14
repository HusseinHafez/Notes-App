import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/providers/notes_controller/notes_cubit.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get()=>BlocProvider.of<HomeCubit>(NotesCubit.navigatorKey.currentContext!);
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  TextEditingController titleController=TextEditingController();
  TextEditingController contentController=TextEditingController();
}

