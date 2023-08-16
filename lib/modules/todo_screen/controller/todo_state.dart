part of 'todo_cubit.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}
final class AddTodoLoadingState extends TodoState {}
final class AddTodoSucessState extends TodoState {}
final class AddTodoErrorState extends TodoState {}


final class ChangeCheckBoxValue extends TodoState {}
