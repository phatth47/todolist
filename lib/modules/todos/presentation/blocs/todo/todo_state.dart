part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoEmpty extends TodoState {}

class TodoData extends TodoState {
  final TodoListingModel todoResponse;

  const TodoData(this.todoResponse);

  @override
  List<Object?> get props => [todoResponse];
}

class TodoError extends TodoState {
  final String error;

  const TodoError(this.error);

  @override
  List<Object?> get props => [error];
}

