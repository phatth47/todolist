part of 'todo_bloc.dart';

abstract class TodoEvent {}

class GetTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todo;

  AddTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final TodoModel todo;

  DeleteTodoEvent(this.todo);
}

class MarkDoneTodoEvent extends TodoEvent {
  final TodoModel todo;

  MarkDoneTodoEvent(this.todo);
}
