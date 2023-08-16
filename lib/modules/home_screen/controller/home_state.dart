part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class AddNoteLoadingState extends HomeState {}
final class AddNoteSucessState extends HomeState {}
final class AddNoteFailureState extends HomeState {}
