
import 'package:get_it/get_it.dart';
import 'package:notes_app/modules/home_screen/controller/home_cubit.dart';
import 'package:notes_app/providers/notes_controller/notes_cubit.dart';

GetIt servicesLocator=GetIt.instance;

Future<void> appServicesLocator()async{

  servicesLocator.registerSingleton<NotesCubit>(NotesCubit());
  servicesLocator.registerSingleton<HomeCubit>(HomeCubit());
}