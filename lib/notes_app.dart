import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes_app/core/utils/app_sevice_locator.dart';
import 'package:notes_app/modules/home_screen/controller/home_cubit.dart';
import 'package:notes_app/modules/home_screen/view/home_screen.dart';
import 'package:notes_app/providers/notes_controller/notes_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/todo_screen/controller/todo_cubit.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => servicesLocator<NotesCubit>(),
        ),
        BlocProvider(
          create: (context) => servicesLocator<HomeCubit>(),
        ),
        BlocProvider(
          create: (context) => servicesLocator<TodoCubit>(),
        )
      ],
      child: BlocBuilder<NotesCubit, NotesState>(
        builder: (context, state) {
          // final controller=NotesCubit.get();
          return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: const HomeScreen(),
                  theme: ThemeData(
                      brightness: Brightness.dark,
                      useMaterial3: true,
                      fontFamily: 'Poppins'),
                  navigatorKey: NotesCubit.navigatorKey,
                );
              });
        },
      ),
    );
  }
}
