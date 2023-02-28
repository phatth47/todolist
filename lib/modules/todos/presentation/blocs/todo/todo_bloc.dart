import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todolist/modules/todos/data/models/todo_listing_model.dart';
import 'package:todolist/modules/todos/data/models/todo_model.dart';
import 'package:todolist/modules/todos/data/sources/todo_source.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoSource source = TodoSource();

  TodoBloc() : super(TodoInitial()) {
    on<GetTodoEvent>(_onGetTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<MarkDoneTodoEvent>(_onMarkDoneTodo);
  }

  Future<void> _onGetTodos(GetTodoEvent event, emit) async {
    try {
      emit(TodoLoading());
      final todoResponse = await source.getTodos();
      if (todoResponse.todoList?.isEmpty ?? false) {
        return emit(TodoEmpty());
      } else {
        return emit(TodoData(todoResponse));
      }
    } catch (_) {
      return emit(const TodoError("Something went wrong"));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, emit) async {
    try {
      if (state is TodoData) {
        final currentState = state as TodoData;
        final currentResponse = currentState.todoResponse;
        final currentTodoList = currentResponse.todoList ?? [];
        final List<TodoModel> newTodoList = [];
        newTodoList.addAll(currentTodoList);
        newTodoList.add(event.todo);

        final newTotal = (currentState.todoResponse.total ?? 0) + 1;
        final newReponse =
            currentResponse.copyWith(todoList: newTodoList, total: newTotal);

        emit(TodoData(newReponse));
      }
    } catch (_) {
      return;
    }
  }

  Future<void> _onDeleteTodo(DeleteTodoEvent event, emit) async {
    try {
      if (state is TodoData) {
        final currentState = state as TodoData;
        final currentResponse = currentState.todoResponse;
        final currentTodoList = currentResponse.todoList ?? [];
        final List<TodoModel> newTodoList = [];
        newTodoList.addAll(currentTodoList);
        newTodoList.remove(event.todo);

        final newTotal = (currentState.todoResponse.total ?? 0) - 1;
        final newReponse =
            currentResponse.copyWith(todoList: newTodoList, total: newTotal);

        emit(TodoData(newReponse));
      }
    } catch (_) {
      return;
    }
  }

  Future<void> _onMarkDoneTodo(MarkDoneTodoEvent event, emit) async {
    try {
      if (state is TodoData) {
        final currentState = state as TodoData;
        final currentResponse = currentState.todoResponse;
        final currentTodoList = currentResponse.todoList ?? [];
        final indexTodoMarkDone =
            currentTodoList.indexWhere((e) => e.id == event.todo.id);
        final newTodo =
            currentTodoList[indexTodoMarkDone].copyWith(isDone: true);
        currentTodoList[indexTodoMarkDone] = newTodo;
        final newReponse = currentResponse.copyWith(todoList: currentTodoList);

        emit(TodoData(newReponse));
      }
    } catch (_) {
      return;
    }
  }
}
