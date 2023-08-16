import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/core/utils/app_constants.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/model/todo_model.dart';
import 'package:notes_app/notes_app.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light
    )
  );
  WidgetsFlutterBinding.ensureInitialized();
 
  await Hive.initFlutter();
 
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(TodoModelAdapter());
   await Hive.openBox<NoteModel>(AppConstants.noteBOx);
   await Hive.openBox<TodoModel>(AppConstants.todoBox);
  await appServicesLocator().then((value) {
    runApp(const NotesApp());
  });
 
}
