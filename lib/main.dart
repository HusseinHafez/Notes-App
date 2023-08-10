import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/notes_app.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light
    )
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NotesApp());
}
